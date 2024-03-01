import 'dart:convert';

class Usermodel {
  final int id;
  final String name;
  final String email;
  final String? email_verified_at;
  final String created_at;
  final String updated_at;
  Usermodel({
    required this.id,
    required this.name,
    required this.email,
    this.email_verified_at,
    required this.created_at,
    required this.updated_at,
  });

  Usermodel copyWith({
    int? id,
    String? name,
    String? email,
    String? email_verified_at,
    String? created_at,
    String? updated_at,
  }) {
    return Usermodel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': email_verified_at,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Usermodel.fromMap(Map<String, dynamic> map) {
    return Usermodel(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      email: map['email'] as String,
      email_verified_at: map['email_verified_at'] == null
          ? null
          : map['email_verified_at'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usermodel.fromJson(String source) =>
      Usermodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Usermodel(id: $id, name: $name, email: $email, email_verified_at: $email_verified_at, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Usermodel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.email_verified_at == email_verified_at &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        email_verified_at.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}

class Email_verified_at {}
