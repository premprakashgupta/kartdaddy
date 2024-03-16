import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';

import '../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search here")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx(
                    () => DropdownButton<String>(
                      underline: SizedBox(),
                      value: _searchScreenController.selectedDropDown.value,
                      onChanged: (value) {
                        _searchScreenController.selectedDropDown.value = value!;
                      },
                      items:
                          _searchScreenController.categories.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: _searchScreenController.searchController,
                    onChanged: (value) {
                      _searchScreenController.query.value = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                )
              ],
            ),
          ),

          const Gap(10),
          Obx(
            () => _searchScreenController.loading.value
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
