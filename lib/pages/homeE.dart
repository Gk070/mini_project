import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/util/subbox.dart';
import 'package:mini_project/services/authServices.dart';

class HomeE extends StatefulWidget {
  @override
  _HomeEState createState() => _HomeEState();
}

class _HomeEState extends State<HomeE> {
  String username = "User";
  String profileImageUrl = "";
  String? userEmail;
  bool isLoading = true;
  AuthServices _authServices = AuthServices();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  /// 🔹 Fetch user details including email
  Future<void> _fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Get user email for job filtering
        setState(() {
          userEmail = user.email;
        });

        // Fetch additional user data
        DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

        if (userDoc.exists) {
          setState(() {
            username = userDoc['name'] ?? "User";
            profileImageUrl = userDoc['profileImage'] ?? "";
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          print("User document does not exist");
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print("No current user");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 **Header with Logout & Profile**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    _authServices.signOut();
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                Text(
                  "Hello, $username",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    color: Colors.indigo[400],
                  ),
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.indigo[300],
                    backgroundImage:
                    profileImageUrl.isNotEmpty ? NetworkImage(profileImageUrl) : null,
                    child: profileImageUrl.isEmpty
                        ? Icon(Icons.person, color: Colors.white)
                        : null,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profileE');
                  },
                ),
              ],
            ),
            SizedBox(height: 30.0),

            /// 🔹 **Categories Row**
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var jobType
                  in ['All Jobs', 'Plumber', 'Technician', 'Electrician', 'Carpenter', 'Mason'])
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: SubBox(type: jobType),
                    ),
                ],
              ),
            ),
            SizedBox(height: 15.0),

            /// 🔹 **Jobs List Section**
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : userEmail == null
                  ? Center(child: Text("Error loading user data. Please login again.",
                  style: TextStyle(fontSize: 16, color: Colors.red)))
                  : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("job_posts")
                // Filter by the user's Gmail address
                    .where("email", isEqualTo: userEmail)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                        child: Text("Error loading jobs: ${snapshot.error}",
                            style: TextStyle(fontSize: 16, color: Colors.red)));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                        child: Text("No jobs posted yet",
                            style: TextStyle(fontSize: 18, color: Colors.grey)));
                  }

                  var jobs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      var jobData = jobs[index].data() as Map<String, dynamic>;

                      return Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(jobData["jobName"] ?? "Unnamed Job",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo[900])),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text("📍 ${jobData["district"] ?? "Unknown"}, ${jobData["place"] ?? "Unknown"}",
                                  style: TextStyle(fontSize: 16)),
                              Text("💰 Price: ${jobData["price"] ?? "Not specified"}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700])),
                              Text("📧 Contact: ${jobData["email"] ?? "No email"}",
                                  style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            /// 🔹 **Add Job Button**
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addJob');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo[500],
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 25),
                    SizedBox(width: 10.0),
                    Text(
                      'Add Jobs',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}