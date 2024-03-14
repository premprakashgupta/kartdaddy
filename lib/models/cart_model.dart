import 'dart:convert';

import 'package:kartdaddy/models/product_model.dart';

class CartModel {
  final int id;
  final String product_id;
  final String quantity;
  final String total_price;
  final String? walletAmountUsed;
  final String product_price;
  final ProductModel product;
  CartModel({
    required this.id,
    required this.product_id,
    required this.quantity,
    required this.total_price,
    required this.walletAmountUsed,
    required this.product_price,
    required this.product,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_id': product_id,
      'quantity': quantity,
      'total_price': total_price,
      'walletAmountUsed': walletAmountUsed ?? null,
      'product_price': product_price,
      'product': product,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'].toInt() as int,
      product_id: map['product_id'] as String,
      quantity: map['quantity'] as String,
      total_price: map['total_price'] as String,
      walletAmountUsed: map['walletAmountUsed'] != null
          ? map['walletAmountUsed'] as String
          : null,
      product_price: map['product_price'] as String,
      product: ProductModel.fromMap(map['product']),
    );
  }
}
