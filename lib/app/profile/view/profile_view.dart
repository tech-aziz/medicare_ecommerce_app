import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = "Loading...";
  String imageUrl = "";
  String branch = "Loading...";
  String phone = "";

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name') ?? 'Guest';
      imageUrl = prefs.getString('image') ?? ""; // Default empty if no image
      branch = prefs.getString('branch') ?? 'Not available';
      phone = prefs.getString("phone") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Circular profile photo
              CircleAvatar(
                radius: 60,
                backgroundImage: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : AssetImage('assets/images/default_profile.png')
                        as ImageProvider, // Default profile image
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              // Edit icon
              // Positioned(
              //   bottom: 5,
              //   right: 10,
              //   child: InkWell(
              //     onTap: () {
              //       // Add functionality for editing photo
              //     },
              //     child: CircleAvatar(
              //       radius: 18,
              //       backgroundColor: Colors.blue,
              //       child: Icon(
              //         Icons.edit,
              //         color: Colors.white,
              //         size: 20,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 20),
          // User name
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          // Branch
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.store, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "Branch: $branch",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Phone number
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.phone, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "${phone}", // Replace with actual phone data if available
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Email address
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "johndoe@example.com", // Replace with actual email if available
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
