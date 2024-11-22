import 'package:flutter/material.dart';
class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'name': 'ACI', 'logo': 'https://via.placeholder.com/100?text=Apple'},
      {
        'name': 'Square',
        'logo': 'https://via.placeholder.com/100?text=Samsung'
      },
      {'name': 'ACME', 'logo': 'https://via.placeholder.com/100?text=Google'},
      {
        'name': 'Ad-dIn',
        'logo': 'https://via.placeholder.com/100?text=Microsoft'
      },
      {
        'name': 'ACI Limited',
        'logo': 'https://via.placeholder.com/100?text=Amazon'
      },
      {
        'name': 'Alco pharma',
        'logo': 'https://via.placeholder.com/100?text=Tesla'
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    categories[index]['logo']!,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(height: 8),
                  Text(
                    categories[index]['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
