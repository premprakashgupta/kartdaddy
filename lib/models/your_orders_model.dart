// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class YourOrdersModel {
  final int id;
  final String order_id;
  final String product_name;
  final String status;

  YourOrdersModel(
      {required this.id,
      required this.order_id,
      required this.product_name,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_id': order_id,
      'product_name': product_name,
      'status': status,
    };
  }

  factory YourOrdersModel.fromMap(Map<String, dynamic> map) {
    return YourOrdersModel(
      id: map['id'] as int,
      order_id: map['order_id'] as String,
      product_name: map['product_name'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory YourOrdersModel.fromJson(String source) =>
      YourOrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
