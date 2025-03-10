import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileE extends StatefulWidget {
  @override
  _ProfileEState createState() => _ProfileEState();
}

class _ProfileEState extends State<ProfileE> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phnController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  File? _profileImage;
  String? _imageUrl;
  bool _isLoading = true;

  // Use current user's UID for document ID
  final String _collectionPath = 'profileE';
  late final String _documentId;
  String? _email;

  @override
  void initState() {
    super.initState();
    // Get current user UID
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _documentId = currentUser.uid;
      _email = currentUser.email;
    } else {
      _documentId = 'guest';
    }
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      print("Fetching profile data for user: $_documentId");

      // Reference to the specific document
      DocumentReference docRef = FirebaseFirestore.instance
          .collection(_collectionPath)
          .doc(_documentId);

      DocumentSnapshot snapshot = await docRef.get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _nameController.text = data['name'] ?? '';
          _phnController.text = data['phone'] ?? '';
          _districtController.text = data['district'] ?? '';
          _placeController.text = data['place'] ?? '';
          _imageUrl = data['image_url'];
        });
        print("Profile data fetched successfully");
      } else {
        print("Document does not exist, will be created when saving");
      }
    } catch (e) {
      print("Error fetching profile data: $e");
      _showCupertinoAlert("Error", "Failed to fetch profile data: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _checkValidation() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        print("Saving profile data to $_collectionPath/$_documentId");

        // Create profile data map
        Map<String, dynamic> profileData = {
          'name': _nameController.text,
          'phone': _phnController.text,
          'district': _districtController.text,
          'place': _placeController.text,
          'email': _email,
        };

        // Only add image_url if it exists
        if (_imageUrl != null) {
          profileData['image_url'] = _imageUrl;
        }

        // Save to Firestore
        await FirebaseFirestore.instance
            .collection(_collectionPath)
            .doc(_documentId)
            .set(profileData);

        print("Profile data saved successfully");
        _showCupertinoAlert("Success", "Profile updated successfully",
            onDismiss: () => Navigator.pushNamed(context, '/homeE'));
      } catch (e) {
        print("Error saving profile data: $e");
        _showCupertinoAlert("Error", "Failed to save profile data: $e");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() => _profileImage = File(image.path));
        await _uploadImageToFirebase(image);
      }
    } catch (e) {
      print("Error picking image: $e");
      _showCupertinoAlert("Error", "Failed to pick image: $e");
    }
  }

  Future<void> _uploadImageToFirebase(XFile image) async {
    setState(() {
      _isLoading = true;
    });

    try {
      print("Uploading image to Firebase Storage");

      // Create storage reference with user's UID
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('profileE_images')
          .child('$_documentId.jpg');

      // Upload image file
      await storageRef.putFile(File(image.path));
      print("Image uploaded successfully");

      // Get download URL
      String downloadUrl = await storageRef.getDownloadURL();
      print("Image URL: $downloadUrl");

      setState(() {
        _imageUrl = downloadUrl;
      });

      // Update the image URL in Firestore
      try {
        await FirebaseFirestore.instance
            .collection(_collectionPath)
            .doc(_documentId)
            .update({
          'image_url': _imageUrl,
        });
        print("Image URL updated in Firestore");
      } catch (e) {
        print("Failed to update image URL in Firestore: $e");
        // Create document if it doesn't exist
        await FirebaseFirestore.instance
            .collection(_collectionPath)
            .doc(_documentId)
            .set({
          'image_url': _imageUrl,
          'email': _email,
          'name': _nameController.text.isNotEmpty ? _nameController.text : '',
          'phone': _phnController.text.isNotEmpty ? _phnController.text : '',
          'district': _districtController.text.isNotEmpty ? _districtController.text : '',
          'place': _placeController.text.isNotEmpty ? _placeController.text : '',
        });
        print("Created new document with image URL");
      }
    } catch (e) {
      print("Error uploading image: $e");
      _showCupertinoAlert("Error", "Failed to upload image: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showImageSourceDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        title: Text("Select Image Source"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
            child: Text("Camera"),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
            child: Text("Gallery"),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
          isDestructiveAction: true,
        ),
      ),
    );
  }

  void _showCupertinoAlert(String title, String message, {Function? onDismiss}) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
              if (onDismiss != null) onDismiss();
            },
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
            Navigator.pushNamed(context, '/homeE');
          },
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                      ? NetworkImage(_imageUrl!) as ImageProvider
                      : null,
                  backgroundColor: Colors.indigo[100],
                  child: _profileImage == null && _imageUrl == null
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.indigo[300])
                      : null,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("Full Name", _nameController),
              _buildReadOnlyField("Email", _email ?? 'Not available'),
              _buildTextField("Phone No", _phnController, TextInputType.phone),
              _buildTextField("District", _districtController),
              _buildTextField("Place", _placeController),
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
}