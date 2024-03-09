class BannerModel {
  final int id;
  final String banner_title;
  final String banner_description;
  final String banner_url;
  final int product_id;
  final String product_name;
  final String first_image;

  BannerModel({
    required this.id,
    required this.banner_title,
    required this.banner_description,
    required this.banner_url,
    required this.product_id,
    required this.product_name,
    required this.first_image,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      banner_title: map['banner_title'],
      banner_description: map['banner_description'],
      banner_url: map['banner_url'],
      product_id: map['product_id'],
      product_name: map['product_name'],
      first_image: map['first_image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'banner_title': banner_title,
      'banner_description': banner_description,
      'banner_url': banner_url,
      'product_id': product_id,
      'product_name': product_name,
      'first_image': first_image,
    };
  }
}
