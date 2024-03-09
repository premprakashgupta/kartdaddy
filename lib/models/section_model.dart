import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kartdaddy/models/product_model.dart';

class SectionModel {
  final String title;
  final String slug;
  final int limitForApp;
  final List<ProductModel> products;
  SectionModel({
    required this.title,
    required this.slug,
    required this.limitForApp,
    required this.products,
  });

  SectionModel copyWith({
    String? title,
    String? slug,
    int? limitForApp,
    List<ProductModel>? products,
  }) {
    return SectionModel(
      title: title ?? this.title,
      slug: slug ?? this.slug,
      limitForApp: limitForApp ?? this.limitForApp,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'slug': slug,
      'limitForApp': limitForApp,
      'products': products,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      title: map['title'] as String,
      slug: map['slug'] as String,
      limitForApp: map['limitForApp'] as int,
      products: List<ProductModel>.from((map['products'] as List<dynamic>).map(
          (product) => ProductModel.fromMap(product as Map<String, dynamic>))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionModel.fromJson(String source) =>
      SectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SectionModel(title: $title, slug: $slug, limitForApp: $limitForApp, products: $products)';
  }

  @override
  bool operator ==(covariant SectionModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.slug == slug &&
        other.limitForApp == limitForApp &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        slug.hashCode ^
        limitForApp.hashCode ^
        products.hashCode;
  }
}
