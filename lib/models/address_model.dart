class AddressModel {
  final int id;
  final int user_id;
  final String type;
  final String first_name;
  final String last_name;
  final String? company_name;
  final String address;
  final String? appart_flat_no;
  final String country;
  final String state;
  final String city;
  final String pin_code;
  final String email;
  final String mobile;
  final String? note;
  final String status;
  final String timestamp;
  final String created_at;
  final String updated_at;
  AddressModel({
    required this.id,
    required this.user_id,
    required this.type,
    required this.first_name,
    required this.last_name,
    this.company_name,
    required this.address,
    this.appart_flat_no,
    required this.country,
    required this.state,
    required this.city,
    required this.pin_code,
    required this.email,
    required this.mobile,
    this.note,
    required this.status,
    required this.timestamp,
    required this.created_at,
    required this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'type': type,
      'first_name': first_name,
      'last_name': last_name,
      'company_name': company_name,
      'address': address,
      'appart_flat_no': appart_flat_no,
      'country': country,
      'state': state,
      'city': city,
      'pin_code': pin_code,
      'email': email,
      'mobile': mobile,
      'note': note,
      'status': status,
      'timestamp': timestamp,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      type: map['type'] as String,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      company_name: map['company_name'] as String?,
      address: map['address'] as String,
      appart_flat_no: map['appart_flat_no'] as String?,
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      pin_code: map['pin_code'] as String,
      email: map['email'] as String,
      mobile: map['mobile'] as String,
      note: map['note'] as String?,
      status: map['status'] as String,
      timestamp: map['timestamp'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }
}
