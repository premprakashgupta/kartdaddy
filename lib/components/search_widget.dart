import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  List<Product> products = [
    Product(name: 'Item 1', price: 20.0),
    Product(name: 'Item 2', price: 30.0),
    Product(name: 'Item 3', price: 40.0),
    // Add more demo data as needed
  ];

  List<Product> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: filteredProducts.isNotEmpty ? 250 : 70,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              onChanged: (value) {
                filterProducts(value);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
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
