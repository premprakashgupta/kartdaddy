// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kartdaddy/models/address_model.dart';

class OrderSummery {
  final int total;
  final int delivery_charge;
  final int wallet_amount_used;
  final int payable_amount;

  OrderSummery(
      {required this.total,
      required this.delivery_charge,
      required this.wallet_amount_used,
      required this.payable_amount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'delivery_charge': delivery_charge,
      'wallet_amount_used': wallet_amount_used,
      'payable_amount': payable_amount,
    };
  }

  factory OrderSummery.fromMap(Map<String, dynamic> map) {
    return OrderSummery(
      total: map['total'] as int,
      delivery_charge: map['delivery_charge'] as int,
      wallet_amount_used: map['wallet_amount_used'] as int,
      payable_amount: map['payable_amount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderSummery.fromJson(String source) =>
      OrderSummery.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OrderReviewModel {
  final OrderSummery order_summary;
  final AddressModel address;

  OrderReviewModel({required this.order_summary, required this.address});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'order_summary': order_summary.toMap(),
      'address': address.toMap(),
    };
  }

  factory OrderReviewModel.fromMap(Map<String, dynamic> map) {
    return OrderReviewModel(
      order_summary:
          OrderSummery.fromMap(map['order_summary'] as Map<String, dynamic>),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderReviewModel.fromJson(String source) =>
      OrderReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
