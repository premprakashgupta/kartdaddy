import 'dart:convert';

class Trendingproductsmodel {
  final int id;
  final String? master_category_id;
  final String? master_category_name;
  final String? category_id;
  final String? category_name;
  final String? sub_category_id;
  final String? sub_category_name;
  final String? brand_id;
  final String? brand_name;
  final String? unit_id;
  final String? unit_name;
  final String? varient_id;
  final String? varient_name;
  final String? attribute_id;
  final String? attribute_name;
  final String? sub_attribute_id;
  final String? sub_attribute_name;
  final String? code;
  final String? hsn_code;
  final String? product_code;
  final String? title;
  final String? full_name;
  final String? short_description;
  final String? basic_info;
  final String? long_description;
  final String? buy_price;
  final String? sale_price;
  final String? discount_type;
  final String? discount_type_amount;
  final String? discount_amount;
  final String? net_sale_amount;
  final String? tax;
  final String? quantity;
  final String? sale_quantity;
  final String? available_stock;
  final String? youtube_link;
  final String? thumb_image;
  final String? main_image;
  final String? gallery_image;
  final String? meta_title;
  final String? meta_description;
  final String? meta_img;
  final String? tags;
  final String? slug;
  final String? insta_link;
  final String? return_exchange_policy;
  final String? fb_link;
  final String? privacy_policy;
  final String? term_condition;
  final int? product_feature_id;
  final int? compare;
  final int? choise_of_two;
  final int? best_seller;
  final int? featured;
  final String? sources;
  final String? product_by;
  final String? added_by_id;
  final String? added_by_name;
  final String? created_by_id;
  final String? created_by_name;
  final String? status;
  final int? walletAmount;
  final String? wallet_amount_type;
  final String? timestamp;
  final String? created_at;
  final String? updated_at;
  final String? subCategorySlug;
  final Pivot? pivot;
  Trendingproductsmodel({
    required this.id,
     this.master_category_id,
     this.master_category_name,
     this.category_id,
     this.category_name,
     this.sub_category_id,
     this.sub_category_name,
     this.brand_id,
     this.brand_name,
     this.unit_id,
     this.unit_name,
     this.varient_id,
     this.varient_name,
     this.attribute_id,
     this.attribute_name,
     this.sub_attribute_id,
     this.sub_attribute_name,
     this.code,
     this.hsn_code,
     this.product_code,
     this.title,
     this.full_name,
     this.short_description,
     this.basic_info,
     this.long_description,
     this.buy_price,
     this.sale_price,
     this.discount_type,
     this.discount_type_amount,
     this.discount_amount,
     this.net_sale_amount,
     this.tax,
     this.quantity,
     this.sale_quantity,
     this.available_stock,
     this.youtube_link,
     this.thumb_image,
     this.main_image,
     this.gallery_image,
     this.meta_title,
     this.meta_description,
     this.meta_img,
     this.tags,
     this.slug,
     this.insta_link,
     this.return_exchange_policy,
     this.fb_link,
     this.privacy_policy,
     this.term_condition,
     this.product_feature_id,
     this.compare,
     this.choise_of_two,
     this.best_seller,
     this.featured,
     this.sources,
     this.product_by,
     this.added_by_id,
     this.added_by_name,
     this.created_by_id,
     this.created_by_name,
     this.status,
     this.walletAmount,
     this.wallet_amount_type,
     this.timestamp,
     this.created_at,
     this.updated_at,
     this.subCategorySlug,
     this.pivot,
  });

  Trendingproductsmodel copyWith({
    int? id,
    String? master_category_id,
    String? master_category_name,
    String? category_id,
    String? category_name,
    String? sub_category_id,
    String? sub_category_name,
    String? brand_id,
    String? brand_name,
    String? unit_id,
    String? unit_name,
    String? varient_id,
    String? varient_name,
    String? attribute_id,
    String? attribute_name,
    String? sub_attribute_id,
    String? sub_attribute_name,
    String? code,
    String? hsn_code,
    String? product_code,
    String? title,
    String? full_name,
    String? short_description,
    String? basic_info,
    String? long_description,
    String? buy_price,
    String? sale_price,
    String? discount_type,
    String? discount_type_amount,
    String? discount_amount,
    String? net_sale_amount,
    String? tax,
    String? quantity,
    String? sale_quantity,
    String? available_stock,
    String? youtube_link,
    String? thumb_image,
    String? main_image,
    String? gallery_image,
    String? meta_title,
    String? meta_description,
    String? meta_img,
    String? tags,
    String? slug,
    String? insta_link,
    String? return_exchange_policy,
    String? fb_link,
    String? privacy_policy,
    String? term_condition,
    int? product_feature_id,
    int? compare,
    int? choise_of_two,
    int? best_seller,
    int? featured,
    String? sources,
    String? product_by,
    String? added_by_id,
    String? added_by_name,
    String? created_by_id,
    String? created_by_name,
    String? status,
    int? walletAmount,
    String? wallet_amount_type,
    String? timestamp,
    String? created_at,
    String? updated_at,
    String? subCategorySlug,
    Pivot? pivot,
  }) {
    return Trendingproductsmodel(
      id: id ?? this.id,
      master_category_id: master_category_id ?? this.master_category_id,
      master_category_name: master_category_name ?? this.master_category_name,
      category_id: category_id ?? this.category_id,
      category_name: category_name ?? this.category_name,
      sub_category_id: sub_category_id ?? this.sub_category_id,
      sub_category_name: sub_category_name ?? this.sub_category_name,
      brand_id: brand_id ?? this.brand_id,
      brand_name: brand_name ?? this.brand_name,
      unit_id: unit_id ?? this.unit_id,
      unit_name: unit_name ?? this.unit_name,
      varient_id: varient_id ?? this.varient_id,
      varient_name: varient_name ?? this.varient_name,
      attribute_id: attribute_id ?? this.attribute_id,
      attribute_name: attribute_name ?? this.attribute_name,
      sub_attribute_id: sub_attribute_id ?? this.sub_attribute_id,
      sub_attribute_name: sub_attribute_name ?? this.sub_attribute_name,
      code: code ?? this.code,
      hsn_code: hsn_code ?? this.hsn_code,
      product_code: product_code ?? this.product_code,
      title: title ?? this.title,
      full_name: full_name ?? this.full_name,
      short_description: short_description ?? this.short_description,
      basic_info: basic_info ?? this.basic_info,
      long_description: long_description ?? this.long_description,
      buy_price: buy_price ?? this.buy_price,
      sale_price: sale_price ?? this.sale_price,
      discount_type: discount_type ?? this.discount_type,
      discount_type_amount: discount_type_amount ?? this.discount_type_amount,
      discount_amount: discount_amount ?? this.discount_amount,
      net_sale_amount: net_sale_amount ?? this.net_sale_amount,
      tax: tax ?? this.tax,
      quantity: quantity ?? this.quantity,
      sale_quantity: sale_quantity ?? this.sale_quantity,
      available_stock: available_stock ?? this.available_stock,
      youtube_link: youtube_link ?? this.youtube_link,
      thumb_image: thumb_image ?? this.thumb_image,
      main_image: main_image ?? this.main_image,
      gallery_image: gallery_image ?? this.gallery_image,
      meta_title: meta_title ?? this.meta_title,
      meta_description: meta_description ?? this.meta_description,
      meta_img: meta_img ?? this.meta_img,
      tags: tags ?? this.tags,
      slug: slug ?? this.slug,
      insta_link: insta_link ?? this.insta_link,
      return_exchange_policy: return_exchange_policy ?? this.return_exchange_policy,
      fb_link: fb_link ?? this.fb_link,
      privacy_policy: privacy_policy ?? this.privacy_policy,
      term_condition: term_condition ?? this.term_condition,
      product_feature_id: product_feature_id ?? this.product_feature_id,
      compare: compare ?? this.compare,
      choise_of_two: choise_of_two ?? this.choise_of_two,
      best_seller: best_seller ?? this.best_seller,
      featured: featured ?? this.featured,
      sources: sources ?? this.sources,
      product_by: product_by ?? this.product_by,
      added_by_id: added_by_id ?? this.added_by_id,
      added_by_name: added_by_name ?? this.added_by_name,
      created_by_id: created_by_id ?? this.created_by_id,
      created_by_name: created_by_name ?? this.created_by_name,
      status: status ?? this.status,
      walletAmount: walletAmount ?? this.walletAmount,
      wallet_amount_type: wallet_amount_type ?? this.wallet_amount_type,
      timestamp: timestamp ?? this.timestamp,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      subCategorySlug: subCategorySlug ?? this.subCategorySlug,
      pivot: pivot ?? this.pivot,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'master_category_id': master_category_id,
      'master_category_name': master_category_name,
      'category_id': category_id,
      'category_name': category_name,
      'sub_category_id': sub_category_id,
      'sub_category_name': sub_category_name,
      'brand_id': brand_id,
      'brand_name': brand_name,
      'unit_id': unit_id,
      'unit_name': unit_name,
      'varient_id': varient_id,
      'varient_name': varient_name,
      'attribute_id': attribute_id,
      'attribute_name': attribute_name,
      'sub_attribute_id': sub_attribute_id,
      'sub_attribute_name': sub_attribute_name,
      'code': code,
      'hsn_code': hsn_code,
      'product_code': product_code,
      'title': title,
      'full_name': full_name,
      'short_description': short_description,
      'basic_info': basic_info,
      'long_description': long_description,
      'buy_price': buy_price,
      'sale_price': sale_price,
      'discount_type': discount_type,
      'discount_type_amount': discount_type_amount,
      'discount_amount': discount_amount,
      'net_sale_amount': net_sale_amount,
      'tax': tax,
      'quantity': quantity,
      'sale_quantity': sale_quantity,
      'available_stock': available_stock,
      'youtube_link': youtube_link,
      'thumb_image': thumb_image,
      'main_image': main_image,
      'gallery_image': gallery_image,
      'meta_title': meta_title,
      'meta_description': meta_description,
      'meta_img': meta_img,
      'tags': tags,
      'slug': slug,
      'insta_link': insta_link,
      'return_exchange_policy': return_exchange_policy,
      'fb_link': fb_link,
      'privacy_policy': privacy_policy,
      'term_condition': term_condition,
      'product_feature_id': product_feature_id,
      'compare': compare,
      'choise_of_two': choise_of_two,
      'best_seller': best_seller,
      'featured': featured,
      'sources': sources,
      'product_by': product_by,
      'added_by_id': added_by_id,
      'added_by_name': added_by_name,
      'created_by_id': created_by_id,
      'created_by_name': created_by_name,
      'status': status,
      'walletAmount': walletAmount,
      'wallet_amount_type': wallet_amount_type,
      'timestamp': timestamp,
      'created_at': created_at,
      'updated_at': updated_at,
      'subCategorySlug': subCategorySlug,
      'pivot': pivot?.toMap(),
    };
  }

  factory Trendingproductsmodel.fromMap(Map<String, dynamic> map) {
    return Trendingproductsmodel(
      id: map['id'].toInt() as int,
      master_category_id: map['master_category_id'] as String,
      master_category_name: map['master_category_name'] as String,
      category_id: map['category_id'] as String,
      category_name: map['category_name'] as String,
      sub_category_id: map['sub_category_id'] as String,
      sub_category_name: map['sub_category_name'] as String,
      brand_id: map['brand_id'] as String,
      brand_name: map['brand_name'] as String,
      unit_id: map['unit_id'] as String,
      unit_name:map['unit_name'] as String,
      varient_id: map['varient_id'] as String,
      varient_name: map['varient_name'] as String,
      attribute_id: map['attribute_id'] as String,
      attribute_name: map['attribute_name'] as String,
      sub_attribute_id: map['sub_attribute_id'] as String,
      sub_attribute_name: map['sub_attribute_name'] as String,
      code: map['code'] as String,
      hsn_code: map['hsn_code'] as String,
      product_code: map['product_code'] as String,
      title: map['title'] as String,
      full_name: map['full_name'] as String,
      short_description: map['short_description'] as String,
      basic_info: map['basic_info'] as String,
      long_description: map['long_description'] as String,
      buy_price: map['buy_price'] as String,
      sale_price: map['sale_price'] as String,
      discount_type: map['discount_type'] as String,
      discount_type_amount: map['discount_type_amount'] as String,
      discount_amount: map['discount_amount'] as String,
      net_sale_amount: map['net_sale_amount'] as String,
      tax: map['tax'] as String,
      quantity: map['quantity'] as String,
      sale_quantity: map['sale_quantity'] as String,
      available_stock: map['available_stock'] as String,
      youtube_link: map['youtube_link'] as String,
      thumb_image: map['thumb_image'] as String,
      main_image: map['main_image'] as String,
      gallery_image: map['gallery_image'] as String,
      meta_title: map['meta_title'] as String,
      meta_description: map['meta_description'] as String,
      meta_img: map['meta_img'] as String,
      tags: map['tags'] as String,
      slug: map['slug'] as String,
      insta_link: map['insta_link'] as String,
      return_exchange_policy: map['return_exchange_policy'] as String,
      fb_link: map['fb_link'] as String,
      privacy_policy: map['privacy_policy'] as String,
      term_condition: map['term_condition'] as String,
      product_feature_id: map['product_feature_id'].toInt() as int,
      compare: map['compare'].toInt() as int,
      choise_of_two: map['choise_of_two'].toInt() as int,
      best_seller: map['best_seller'].toInt() as int,
      featured: map['featured'].toInt() as int,
      sources: map['sources'] as String,
      product_by: map['product_by'] as String,
      added_by_id: map['added_by_id'] as String,
      added_by_name: map['added_by_name'] as String,
      created_by_id: map['created_by_id'] as String,
      created_by_name: map['created_by_name'] as String,
      status: map['status'] as String,
      walletAmount: map['walletAmount'].toInt() as int,
      wallet_amount_type: map['wallet_amount_type'] as String,
      timestamp: map['timestamp'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      subCategorySlug: map['subCategorySlug'] as String,
      pivot: Pivot.fromMap(map['pivot'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Trendingproductsmodel.fromJson(String source) => Trendingproductsmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Trendingproductsmodel(id: $id, master_category_id: $master_category_id, master_category_name: $master_category_name, category_id: $category_id, category_name: $category_name, sub_category_id: $sub_category_id, sub_category_name: $sub_category_name, brand_id: $brand_id, brand_name: $brand_name, unit_id: $unit_id, unit_name: $unit_name, varient_id: $varient_id, varient_name: $varient_name, attribute_id: $attribute_id, attribute_name: $attribute_name, sub_attribute_id: $sub_attribute_id, sub_attribute_name: $sub_attribute_name, code: $code, hsn_code: $hsn_code, product_code: $product_code, title: $title, full_name: $full_name, short_description: $short_description, basic_info: $basic_info, long_description: $long_description, buy_price: $buy_price, sale_price: $sale_price, discount_type: $discount_type, discount_type_amount: $discount_type_amount, discount_amount: $discount_amount, net_sale_amount: $net_sale_amount, tax: $tax, quantity: $quantity, sale_quantity: $sale_quantity, available_stock: $available_stock, youtube_link: $youtube_link, thumb_image: $thumb_image, main_image: $main_image, gallery_image: $gallery_image, meta_title: $meta_title, meta_description: $meta_description, meta_img: $meta_img, tags: $tags, slug: $slug, insta_link: $insta_link, return_exchange_policy: $return_exchange_policy, fb_link: $fb_link, privacy_policy: $privacy_policy, term_condition: $term_condition, product_feature_id: $product_feature_id, compare: $compare, choise_of_two: $choise_of_two, best_seller: $best_seller, featured: $featured, sources: $sources, product_by: $product_by, added_by_id: $added_by_id, added_by_name: $added_by_name, created_by_id: $created_by_id, created_by_name: $created_by_name, status: $status, walletAmount: $walletAmount, wallet_amount_type: $wallet_amount_type, timestamp: $timestamp, created_at: $created_at, updated_at: $updated_at, subCategorySlug: $subCategorySlug, pivot: $pivot)';
  }

  @override
  bool operator ==(covariant Trendingproductsmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.master_category_id == master_category_id &&
      other.master_category_name == master_category_name &&
      other.category_id == category_id &&
      other.category_name == category_name &&
      other.sub_category_id == sub_category_id &&
      other.sub_category_name == sub_category_name &&
      other.brand_id == brand_id &&
      other.brand_name == brand_name &&
      other.unit_id == unit_id &&
      other.unit_name == unit_name &&
      other.varient_id == varient_id &&
      other.varient_name == varient_name &&
      other.attribute_id == attribute_id &&
      other.attribute_name == attribute_name &&
      other.sub_attribute_id == sub_attribute_id &&
      other.sub_attribute_name == sub_attribute_name &&
      other.code == code &&
      other.hsn_code == hsn_code &&
      other.product_code == product_code &&
      other.title == title &&
      other.full_name == full_name &&
      other.short_description == short_description &&
      other.basic_info == basic_info &&
      other.long_description == long_description &&
      other.buy_price == buy_price &&
      other.sale_price == sale_price &&
      other.discount_type == discount_type &&
      other.discount_type_amount == discount_type_amount &&
      other.discount_amount == discount_amount &&
      other.net_sale_amount == net_sale_amount &&
      other.tax == tax &&
      other.quantity == quantity &&
      other.sale_quantity == sale_quantity &&
      other.available_stock == available_stock &&
      other.youtube_link == youtube_link &&
      other.thumb_image == thumb_image &&
      other.main_image == main_image &&
      other.gallery_image == gallery_image &&
      other.meta_title == meta_title &&
      other.meta_description == meta_description &&
      other.meta_img == meta_img &&
      other.tags == tags &&
      other.slug == slug &&
      other.insta_link == insta_link &&
      other.return_exchange_policy == return_exchange_policy &&
      other.fb_link == fb_link &&
      other.privacy_policy == privacy_policy &&
      other.term_condition == term_condition &&
      other.product_feature_id == product_feature_id &&
      other.compare == compare &&
      other.choise_of_two == choise_of_two &&
      other.best_seller == best_seller &&
      other.featured == featured &&
      other.sources == sources &&
      other.product_by == product_by &&
      other.added_by_id == added_by_id &&
      other.added_by_name == added_by_name &&
      other.created_by_id == created_by_id &&
      other.created_by_name == created_by_name &&
      other.status == status &&
      other.walletAmount == walletAmount &&
      other.wallet_amount_type == wallet_amount_type &&
      other.timestamp == timestamp &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.subCategorySlug == subCategorySlug &&
      other.pivot == pivot;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      master_category_id.hashCode ^
      master_category_name.hashCode ^
      category_id.hashCode ^
      category_name.hashCode ^
      sub_category_id.hashCode ^
      sub_category_name.hashCode ^
      brand_id.hashCode ^
      brand_name.hashCode ^
      unit_id.hashCode ^
      unit_name.hashCode ^
      varient_id.hashCode ^
      varient_name.hashCode ^
      attribute_id.hashCode ^
      attribute_name.hashCode ^
      sub_attribute_id.hashCode ^
      sub_attribute_name.hashCode ^
      code.hashCode ^
      hsn_code.hashCode ^
      product_code.hashCode ^
      title.hashCode ^
      full_name.hashCode ^
      short_description.hashCode ^
      basic_info.hashCode ^
      long_description.hashCode ^
      buy_price.hashCode ^
      sale_price.hashCode ^
      discount_type.hashCode ^
      discount_type_amount.hashCode ^
      discount_amount.hashCode ^
      net_sale_amount.hashCode ^
      tax.hashCode ^
      quantity.hashCode ^
      sale_quantity.hashCode ^
      available_stock.hashCode ^
      youtube_link.hashCode ^
      thumb_image.hashCode ^
      main_image.hashCode ^
      gallery_image.hashCode ^
      meta_title.hashCode ^
      meta_description.hashCode ^
      meta_img.hashCode ^
      tags.hashCode ^
      slug.hashCode ^
      insta_link.hashCode ^
      return_exchange_policy.hashCode ^
      fb_link.hashCode ^
      privacy_policy.hashCode ^
      term_condition.hashCode ^
      product_feature_id.hashCode ^
      compare.hashCode ^
      choise_of_two.hashCode ^
      best_seller.hashCode ^
      featured.hashCode ^
      sources.hashCode ^
      product_by.hashCode ^
      added_by_id.hashCode ^
      added_by_name.hashCode ^
      created_by_id.hashCode ^
      created_by_name.hashCode ^
      status.hashCode ^
      walletAmount.hashCode ^
      wallet_amount_type.hashCode ^
      timestamp.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      subCategorySlug.hashCode ^
      pivot.hashCode;
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