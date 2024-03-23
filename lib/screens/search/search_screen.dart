import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kartdaddy/components/custom_circular_progress_indicator.dart';
import 'package:kartdaddy/designs/custom_icons.dart';
import 'package:kartdaddy/models/master_category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchScreenController _searchScreenController =
      Get.put(SearchScreenController());

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search here")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              leading: CustomIcons.search(),
              trailing: [buildMasterCat()],
              
              hintText: AppLocalizations.of(context)!.search,
              controller: _searchScreenController.searchController,
              onChanged: (value) {
                _searchScreenController.query.value = value;
              },
              onSubmitted: (_) {
                _searchScreenController.searchProductWithCategory();
              },
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
                              itemCount: _searchScreenController
                                  .filteredProducts.length,
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
      ),
    );
  }

  Widget buildMasterCat() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => _searchScreenController.loadingMasterCat.value == true
            ? const CustomCircularProgress()
            : PopupMenuButton<MasterCategoryModel>(
                icon: CustomIcons.tune(),
                initialValue: _searchScreenController.selectedDropDown.value,
                onSelected: (value) {
                  _searchScreenController.selectedDropDown.value = value;
                },
                itemBuilder: (BuildContext context) {
                  return _searchScreenController.masterCategories
                      .map((MasterCategoryModel item) {
                    return PopupMenuItem<MasterCategoryModel>(
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
                  }).toList();
                },
              ),
      ),
    );
  }
}
