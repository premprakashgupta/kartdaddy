// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderDetailsModel {
  final int id;
  final String order_no;
  final int product_id;
  final String product_name;
  final String total_price;
  final String payment_mode;
  final String status;

  OrderDetailsModel(
      {required this.id,
      required this.order_no,
      required this.product_id,
      required this.product_name,
      required this.total_price,
      required this.payment_mode,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_no': order_no,
      'product_id': product_id,
      'product_name': product_name,
      'total_price': total_price,
      'payment_mode': payment_mode,
      'status': status,
    };
  }

  factory OrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailsModel(
      id: map['id'] as int,
      order_no: map['order_no'] as String,
      product_id: map['product_id'] as int,
      product_name: map['product_name'] as String,
      total_price: map['total_price'] as String,
      payment_mode: map['payment_mode'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailsModel.fromJson(String source) =>
      OrderDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
