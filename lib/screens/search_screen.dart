import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';

import '../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search here")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _searchScreenController.searchController,
              onChanged: (value) {
                _searchScreenController.query.value = value;
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
          const Gap(10),
          Obx(
            () => _searchScreenController.loading.value == true
                ? const CustomCircularProgress()
                : _searchScreenController.filteredProducts.isNotEmpty
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount:
                                _searchScreenController.filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = _searchScreenController
                                  .filteredProducts[index];
                              return ListTile(
                                onTap: () {
                                  _searchScreenController.onSelect(
                                      item: product);
                                },
                                title: Text(product),
                              );
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
