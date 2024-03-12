import 'package:kartdaddy/models/product_model.dart';

class ProductDetailModel {
  final ProductModel product;
  final List<String> productImages;
  final List<ProductModel> relatedProducts;

  ProductDetailModel({
    required this.product,
    required this.productImages,
    required this.relatedProducts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product,
      'productImages': productImages,
      'relatedProducts': relatedProducts,
    };
  }

  factory ProductDetailModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailModel(
        product: ProductModel.fromMap(map['product']),
        productImages: (map['productImages'] as List<dynamic>)
            .map((e) => e as String)
          .toList(),
      relatedProducts: (map['relatedProducts'] as List<dynamic>)
          .map((e) => ProductModel.fromMap(e))
          .toList(),
    );
  }
}
