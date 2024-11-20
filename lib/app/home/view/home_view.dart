import 'package:flutter/material.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentIndex = 0;

  final List<String> _titles = [
    'Home',
    'Company',
    'Offers',
    'Cart',
    'Account',
  ];


  final List<String> sliderImageList = [
    'https://c8.alamy.com/comp/H693RY/paddy-harvest-in-the-philippines-H693RY.jpg',
    'https://c8.alamy.com/comp/CB704R/indian-woman-cutting-rice-in-the-middle-of-a-ripe-paddy-field-with-CB704R.jpg',
    'https://c8.alamy.com/comp/J1FF46/a-farmer-holds-a-paddy-sheaf-at-chalanbeel-natore-bangladesh-J1FF46.jpg',
    'https://c8.alamy.com/comp/H693RY/paddy-harvest-in-the-philippines-H693RY.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJr2k0NKfEoAyTSgllUuRLMHvyq4cQgzrDMbqdN4K6-XQZlXWXycGThDTVtQ1A37CmMlw&usqp=CAU',
    'https://c8.alamy.com/comp/H693RY/paddy-harvest-in-the-philippines-H693RY.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex],style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body:  _currentIndex == 1 ? _buildCategoryGrid() : _buildBodyText(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // To show all items with text
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );

  }


  Widget _buildBodyText() {
    return Center(
      child: Text(
        _titles[_currentIndex],
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }


  Widget _buildCategoryGrid() {
    final List<Map<String, String>> categories = [
      {'name': 'ACI', 'logo': 'https://via.placeholder.com/100?text=Apple'},
      {'name': 'Square', 'logo': 'https://via.placeholder.com/100?text=Samsung'},
      {'name': 'ACME', 'logo': 'https://via.placeholder.com/100?text=Google'},
      {'name': 'Ad-dIn', 'logo': 'https://via.placeholder.com/100?text=Microsoft'},
      {'name': 'ACI Limited', 'logo': 'https://via.placeholder.com/100?text=Amazon'},
      {'name': 'Alco pharma', 'logo': 'https://via.placeholder.com/100?text=Tesla'},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
