import 'dart:convert';

class ProductModel {
  final int id;

  final String? category_name;
  final String? thumb_image;
  final String? title;

  final String? discount_type_amount;
  final String? net_sale_amount;

  ProductModel({
    required this.id,
    this.category_name,
    this.thumb_image,
    this.title,
    this.discount_type_amount,
    this.net_sale_amount,
  });

  ProductModel copyWith({
    int? id,
    String? category_name,
    String? title,
    String? thumb_image,
    String? discount_type_amount,
    String? net_sale_amount,
  }) {
    return ProductModel(
      id: id ?? this.id,
      category_name: category_name ?? this.category_name,
      thumb_image: thumb_image ?? this.thumb_image,
      title: title ?? this.title,
      discount_type_amount: discount_type_amount ?? this.discount_type_amount,
      net_sale_amount: net_sale_amount ?? this.net_sale_amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_name': category_name,
      'thumb_image': thumb_image,
      'title': title,
      'discount_type_amount': discount_type_amount,
      'net_sale_amount': net_sale_amount,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'].toInt() as int,
      category_name: map['category_name'] as String? ?? "null",
      thumb_image: map['thumb_image'] as String? ?? "211541686207243.gif",
      title: map['title'] as String? ?? "default_title",
      discount_type_amount: map['discount_type_amount'] as String? ?? "null",
      net_sale_amount: map['net_sale_amount'] as String? ?? "null",
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, category_name: $category_name,  title: $title, discount_type_amount: $discount_type_amount, net_sale_amount: $net_sale_amount, ';
  }
}

class Pivot {
  final int section_id;
  final int product_id;
  Pivot({
    required this.section_id,
    required this.product_id,
  });

  Pivot copyWith({
    int? section_id,
    int? product_id,
  }) {
    return Pivot(
      section_id: section_id ?? this.section_id,
      product_id: product_id ?? this.product_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'section_id': section_id,
      'product_id': product_id,
    };
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      section_id: map['section_id'].toInt() as int,
      product_id: map['product_id'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) =>
      Pivot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Pivot(section_id: $section_id, product_id: $product_id)';

  @override
  bool operator ==(covariant Pivot other) {
    if (identical(this, other)) return true;

    return other.section_id == section_id && other.product_id == product_id;
  }

  @override
  int get hashCode => section_id.hashCode ^ product_id.hashCode;
}
