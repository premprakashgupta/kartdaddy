import 'package:kartdaddy/models/product_model.dart';

class ProductDetailModel {
  final ProductModel product;
  final List<String> productImages;

  ProductDetailModel({
    required this.product,
    required this.productImages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product,
      'productImages': productImages,
    };
  }

  factory ProductDetailModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailModel(
        product: ProductModel.fromMap(map['product']),
        productImages: (map['productImages'] as List<dynamic>)
            .map((e) => e as String)
            .toList());
  }
}
