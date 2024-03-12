import 'dart:convert';

class UserModel {
  final int id;
  final String? parent_id;
  final String name;
  final int? wallet_amount;
  final String? referral_code;
  final String? avatar;
  final String mobile;
  final String email;
  final String? email_verified_at;
  final String created_at;
  final String updated_at;
  final int? status;
  UserModel({
    required this.id,
    this.parent_id,
    required this.name,
    this.wallet_amount,
    this.referral_code,
    this.avatar,
    required this.mobile,
    required this.email,
    this.email_verified_at,
    required this.created_at,
    required this.updated_at,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parent_id': parent_id ?? null,
      'name': name,
      'wallet_amount': wallet_amount ?? null,
      'referral_code': referral_code ?? null,
      'avatar': avatar ?? null,
      'mobile': mobile,
      'email': email,
      'email_verified_at': email_verified_at ?? null,
      'created_at': created_at,
      'updated_at': updated_at,
      'status': status ?? null,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      parent_id: map['parent_id'] != null ? map['parent_id'] as String : null,
      name: map['name'] as String,
      wallet_amount: map['wallet_amount'] != null
          ? map['wallet_amount'].toInt() as int
          : 0,
      referral_code:
          map['referral_code'] != null ? map['referral_code'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      mobile: map['mobile'] as String,
      email: map['email'] as String,
      email_verified_at: map['email_verified_at'] != null
          ? map['email_verified_at'] as String
          : null,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      status: map['status'] != null ? map['status'].toInt() as int : null,
    );
  }

  
}
