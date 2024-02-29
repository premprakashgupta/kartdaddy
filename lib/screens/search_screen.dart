import 'package:flutter/material.dart';
import 'dart:async';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product> products = [
    Product(name: 'Item 1', price: 20.0),
    Product(name: 'Item 2', price: 30.0),
    // Add more demo data as needed
  ];

  List<Product> filteredProducts = [];
  final _searchController = TextEditingController();
  late Timer _debounce;

  @override
  void initState() {
    super.initState();
    _debounce = Timer(const Duration(milliseconds: 500), () {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search here")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                _debounce.cancel(); // Cancel the previous debounce
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  filterProducts(value);
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),
          filteredProducts.isNotEmpty
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          title: Text(filteredProducts[index].name),
                          subtitle: Text(
                              '\$${filteredProducts[index].price.toString()}'),
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void filterProducts(String query) {
    setState(() {
      if (query == "") {
        filteredProducts.clear();
      } else {
        filteredProducts = products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }
}
