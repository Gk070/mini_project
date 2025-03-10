import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _jobsController = TextEditingController();

  final currentUser  = FirebaseAuth.instance.currentUser !;
  bool _isDownloading = false;
  File? _profileImage;
  File? _document; // Define the _document variable
  String? _imageUrl; // To store the image URL

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('profile')
          .doc(currentUser .uid)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        _nameController.text = data['name'] ?? '';
        _phnController.text = data['phone'] ?? '';
        _districtController.text = data['district'] ?? '';
        _expController.text = data['experience'] ?? '';
        _placeController.text = data['place'] ?? '';
        _jobsController.text = data['jobs_interested'] ?? '';
        _imageUrl = data['image_url']; // Retrieve the image URL
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to fetch profile data: $e");
    }
  }

  void _checkValidation() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> profileData = {
        'name': _nameController.text,
        'phone': _phnController.text,
        'district': _districtController.text,
        'experience': _expController.text,
        'place': _placeController.text,
        'jobs_interested': _jobsController.text,
        'email': currentUser .email,
        'image_url': _imageUrl, // Include image URL in profile data
      };

      try {
        await FirebaseFirestore.instance
            .collection('profile')
            .doc(currentUser .uid)
            .set(profileData);

        Navigator.pop(context);
        Navigator.pushNamed(context, '/homeW');
      } catch (e) {
        _showAlertDialog("Error", "Failed to save profile data: $e");
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() => _profileImage = File(image.path));
        await _uploadImageToFirebase(image); // Upload the image
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to pick image: $e");
    }
  }

  Future<void> _uploadImageToFirebase(XFile image) async {
    try {
      // Create a reference to the Firebase Storage
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${currentUser .uid}.jpg');

      // Upload the image
      await storageRef.putFile(File(image.path));

      // Get the download URL
      String downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        _imageUrl = downloadUrl; // Store the image URL
      });

      // Update Firestore with the new image URL
      await FirebaseFirestore.instance
          .collection('profile')
          .doc(currentUser .uid)
          .update({'image_url': _imageUrl});
    } catch (e) {
      _showAlertDialog("Error", "Failed to upload image: $e");
    }
  }

  Future<void> _pickDocument() async {
    try {
      final picker = ImagePicker();
      final document = await picker.pickImage(source: ImageSource.gallery);
      if (document != null) {
        setState(() => _document = File(document.path)); // Set the document file
      }
    } catch (e) {
      _showAlertDialog("Error", "Failed to pick document: $e");
    }
  }

  Future<void> _downloadSampleDocument() async {
    try {
      setState(() => _isDownloading = true);

      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/sample_document.pdf';

      final data = await rootBundle.load('pdfs/sample.pdf');
      final file = File(filePath);
      await file.writeAsBytes(data.buffer.asUint8List());

      await OpenFile.open(filePath);

      _showAlertDialog("Success", "Sample document saved and opened.");
    } catch (e) {
      _showAlertDialog("Error", "Failed to download document: $e");
    } finally {
      setState(() => _isDownloading = false);
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          _buildListTile("Camera", Icons.camera_alt, () => _pickImage(ImageSource.camera)),
          _buildListTile("Gallery", Icons.photo_library, () => _pickImage(ImageSource.gallery)),
        ],
      ),
    );
  }

  ListTile _buildListTile(String text, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo[300]),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text("OK", style: TextStyle(color: Colors.indigo[300])),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.indigo[800],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/homeW');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _showImageSourceDialog,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : _imageUrl != null
                      ? NetworkImage(_imageUrl!) // Use the image URL if available
                      : null,
                  backgroundColor: Colors.indigo[100],
                  child: _profileImage == null && _imageUrl == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.indigo[300])
                      : null,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Full Name", _nameController),
              _buildReadOnlyField("Email", currentUser .email!),
              _buildTextField("Phone No", _phnController, TextInputType.phone),
              _buildTextField("Jobs Interested", _jobsController),
              _buildTextField("Experience", _expController, TextInputType.number),
              _buildTextField("District", _districtController),
              _buildTextField("Place", _placeController),
              _buildFileUploadSection(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkValidation,
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[500],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.indigo[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) => value == null || value.isEmpty ? "$label is required" : null,
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: true,
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.indigo[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildFileUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFileButton("Upload Document", Icons.upload_file, _pickDocument),
        SizedBox(height: 10),
        _buildFileButton("Download Sample Document", Icons.download, _downloadSampleDocument),
      ],
    );
  }

  Widget _buildFileButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo[400],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}