import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/util/subbox.dart';
import 'package:mini_project/services/authServices.dart';

class HomeW extends StatefulWidget {
  @override
  _HomeWState createState() => _HomeWState();
}

class _HomeWState extends State<HomeW> {
  String username = "Worker";
  String profileImageUrl = "";
  bool isLoading = true;
  AuthServices _authServices = AuthServices();
  FirebaseAuth _auth = FirebaseAuth.instance;

  final Map<String, String> jobNavigationMap = {
    'Electrician': '/applyElec',
    'Plumber': '/applyPlum',
    'Carpenter': '/applyCarp',
    'Farmer': '/applyFarmer',
    'Mason': '/applyMason',
    'Pharmacist': '/applyPharm',
    'Technician': '/applyTech',
    'Welder': '/applyWel',
  };

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            username = userDoc['name'] ?? "Worker";
            profileImageUrl = userDoc['profileImage'] ?? "";
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToJobPage(String jobName) {
    String? route = jobNavigationMap[jobName];
    if (route != null) {
      Navigator.pushNamed(context, route);
    } else {
      Navigator.pushNamed(context, '/jobDetails', arguments: jobName);
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
                    Navigator.pushNamed(context, '/profile');
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
                  for (var jobType in [
                    'All Jobs',
                    'Plumber',
                    'Technician',
                    'Electrician',
                    'Carpenter',
                    'Mason'
                  ])
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
                  : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("job_posts").snapshots(),
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
                        child: Text("No jobs available",
                            style: TextStyle(fontSize: 18, color: Colors.grey)));
                  }

                  var jobs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      var jobData = jobs[index].data() as Map<String, dynamic>;
                      String jobName = jobData["jobName"] ?? "Unnamed Job";

                      return GestureDetector(
                        onTap: () => _navigateToJobPage(jobName),
                        child: Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(15),
                            title: Text(jobName,
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
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
