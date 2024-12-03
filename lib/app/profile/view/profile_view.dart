import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=1024x1024&w=is&k=20&c=y4FFqpMLolCvEqoxlr4oypQqhAL1ta0ojXUnOofQXHk="), // Add your image asset
                backgroundColor: Colors.grey[300],
              ),
              // Edit icon
              Positioned(
                bottom: 5,
                right: 10,
                child: InkWell(
                  onTap: () {
                    // Add functionality for editing photo
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // User name
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          // Phone number
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.phone, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "+1 123 456 7890",
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
                "johndoe@example.com",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
