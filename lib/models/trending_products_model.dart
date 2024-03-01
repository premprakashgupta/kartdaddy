import 'dart:convert';

class Trendingproductsmodel {
  final int id;
  
  final String? category_name;
  
  final String? title;
  
  final String? buy_price;
  final String? sale_price;
  
  Trendingproductsmodel({
    required this.id,
    
    this.category_name,
     this.title,
     
     this.buy_price,
     this.sale_price,
     
  });

  Trendingproductsmodel copyWith({
    int? id,
   
    String? category_name,
    
    String? title,
    
    String? buy_price,
    String? sale_price,
    
  }) {
    return Trendingproductsmodel(
      id: id ?? this.id,
      
      category_name: category_name ?? this.category_name,
      
      title: title ?? this.title,
     
      buy_price: buy_price ?? this.buy_price,
      sale_price: sale_price ?? this.sale_price,
      
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      
      'category_name': category_name,
      
      'title': title,
      
      'buy_price': buy_price,
      'sale_price': sale_price,
      
    };
  }

  factory Trendingproductsmodel.fromMap(Map<String, dynamic> map) {
    return Trendingproductsmodel(
      id: map['id'].toInt() as int,
      
      category_name: map['category_name'] as String,
      
      title: map['title'] as String,
      
      buy_price: map['buy_price'] as String,
      sale_price: map['sale_price'] as String,
     
    );
  }

  String toJson() => json.encode(toMap());

  factory Trendingproductsmodel.fromJson(String source) => Trendingproductsmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Trendingproductsmodel(id: $id, category_name: $category_name,  title: $title, buy_price: $buy_price, sale_price: $sale_price, ';
  }

  
}



class Pivot {
  final int section_id;
  final int product_id;
  Pivot({
    required this.section_id,
    required this.product_id,
  });

  Pivot copyWith({
    int? section_id,
    int? product_id,
  }) {
    return Pivot(
      section_id: section_id ?? this.section_id,
      product_id: product_id ?? this.product_id,
    );
  }

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

  String toJson() => json.encode(toMap());

  factory Pivot.fromJson(String source) => Pivot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Pivot(section_id: $section_id, product_id: $product_id)';

  @override
  bool operator ==(covariant Pivot other) {
    if (identical(this, other)) return true;
  
    return 
      other.section_id == section_id &&
      other.product_id == product_id;
  }

  @override
  int get hashCode => section_id.hashCode ^ product_id.hashCode;
}