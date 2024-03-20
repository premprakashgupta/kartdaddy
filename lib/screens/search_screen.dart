import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/models/master_category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: _searchScreenController.searchController,
                    onChanged: (value) {
                      _searchScreenController.query.value = value;
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _searchScreenController.searchProductWithCategory();
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => _searchScreenController.loadingMasterCat.value == true
                  ? CustomCircularProgress()
                  : DropdownButton<MasterCategoryModel>(
                      underline: SizedBox(),
                      value: _searchScreenController.selectedDropDown.value,
                      onChanged: (value) {
                        _searchScreenController.selectedDropDown.value = value!;
                      },
                      items: _searchScreenController.masterCategories
                          .map((MasterCategoryModel item) {
                        return DropdownMenuItem<MasterCategoryModel>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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
