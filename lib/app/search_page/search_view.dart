import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicare_ecommerce_app/app/all_product/view/product_model.dart';
import '../../app/res/color.dart';
import '../../utils/urls.dart';
import '../cart/cart_manager.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> _searchResults = [];
  Timer? _debounce;

  bool _isLoading = false;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Debounced search function
  void _onSearchChanged(String keyword) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (keyword.isNotEmpty) {
        _fetchSearchResults(keyword);
      } else {
        setState(() {
          _searchResults.clear();
        });
      }
    });
  }

  /// Fetch search results from the API
  Future<void> _fetchSearchResults(String keyword) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse(AppURL.getProduct),
        body: json.encode({"keyWord": keyword}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _searchResults =
              data.map((item) => ProductModel.fromJson(item)).toList();
        });
      } else {
        Get.snackbar('Error', 'Failed to fetch search results.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Search Input Field
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: const InputDecoration(
                        hintText: 'Search Product ',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Loading Indicator
            if (_isLoading) const CircularProgressIndicator(),

            // Search Results
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(child: Text('No results found.'))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final product = _searchResults[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: 
                            
                            ListTile(
                              leading: product.imageName != null
                                  ? Image.network(
                                      'https://app.tophealthpharma.com/uploads/products/${product.imageName}',
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // Show default image if network image fails to load
                                        return Image.network(
                                            'https://app.tophealthpharma.com/assets/no_image.gif',
                                            fit: BoxFit.contain);
                                      },
                                    )
                                  : Image.network(
                                      'https://app.tophealthpharma.com/assets/no_image.gif',
                                      fit: BoxFit.contain),
                              title: Text(product.productName.toString()),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productCategoryName.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ' ${product.convertionName}',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '৳${product.productSellingPrice}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          CartManager().addToCart(
                                              int.parse(product.productSlNo
                                                  .toString()),
                                              1,
                                              double.parse(product.productSlNo
                                                  .toString()),
                                              product.productName.toString(), product.imageName.toString());

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Added to cart successfully!'),
                                              duration:
                                                  const Duration(seconds: 2),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.green,
                                          ),
                                          child: const Text(
                                            'Add to cart',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                         
                          ),
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
