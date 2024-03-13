
class ProductModel {
  final int id;

  final String? category_name;
  final String? thumb_image;
  final String? title;
  final String? slug;
  final String? timestamp;
  final String? discount_type_amount;
  final String? net_sale_amount;
  final String? short_description;

  ProductModel({
    required this.id,
    this.category_name,
    this.thumb_image,
    this.title,
    this.discount_type_amount,
    this.net_sale_amount,
    this.slug,
    this.timestamp,
    this.short_description,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_name': category_name,
      'thumb_image': thumb_image,
      'title': title,
      'discount_type_amount': discount_type_amount,
      'net_sale_amount': net_sale_amount,
      'timestamp': timestamp,
      'slug': slug,
      'short_description': short_description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'].toInt() as int,
      category_name: map['category_name'] as String? ?? "null",
      thumb_image: map['thumb_image'] as String? ?? "211541686207243.gif",
      title: map['title'] as String? ?? "default_title",
      discount_type_amount: map['discount_type_amount'] as String? ?? "null",
      net_sale_amount: map['net_sale_amount'] as String? ?? "null",
      timestamp: map['timestamp'] as String? ?? "null",
      slug: map['slug'] as String? ?? "null",
      short_description: map['short_description'] as String? ?? "null",
    );
  }

  
}

class Pivot {
  final int section_id;
  final int product_id;
  Pivot({
    required this.section_id,
    required this.product_id,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'section_id': section_id,
      'product_id': product_id,
    };
  }

  factory Pivot.fromMap(Map<String, dynamic> map) {
    return Pivot(
      section_id: map['section_id'].toInt() as int,
      product_id: map['product_id'].toInt() as int,
    );
  }

 
}
