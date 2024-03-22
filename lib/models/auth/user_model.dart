// ignore_for_file: public_member_api_docs, sort_constructors_first

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
      'parent_id': parent_id,
      'name': name,
      'wallet_amount': wallet_amount,
      'referral_code': referral_code,
      'avatar': avatar,
      'mobile': mobile,
      'email': email,
      'email_verified_at': email_verified_at,
      'created_at': created_at,
      'updated_at': updated_at,
      'status': status,
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

  

  UserModel copyWith({
    int? id,
    String? parent_id,
    String? name,
    int? wallet_amount,
    String? referral_code,
    String? avatar,
    String? mobile,
    String? email,
    String? email_verified_at,
    String? created_at,
    String? updated_at,
    int? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      parent_id: parent_id ?? this.parent_id,
      name: name ?? this.name,
      wallet_amount: wallet_amount ?? this.wallet_amount,
      referral_code: referral_code ?? this.referral_code,
      avatar: avatar ?? this.avatar,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      status: status ?? this.status,
    );
  }
}
