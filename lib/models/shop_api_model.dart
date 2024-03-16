class ShopApiModel {
  final int id;
  final String? subCategoryName;
  final String? subCategorySlug;
  final String? title;
  final String slug;
  final int? walletAmount;
  final String? thumbImage;
  final String? buyPrice;
  final String? sellPrice;
  final String? quantity;
  final String? timestamp;
  final bool? isWishlist;

  ShopApiModel({
    required this.id,
    this.subCategoryName,
    this.subCategorySlug,
    this.title,
    required this.slug,
    this.walletAmount,
    this.thumbImage,
    this.quantity,
    this.timestamp,
    this.buyPrice,
    this.sellPrice,
    this.isWishlist,
  });

  factory ShopApiModel.fromJson(Map<String, dynamic> json) {
    return ShopApiModel(
      id: json['id'] as int,
      subCategoryName: json['sub_category_name'] as String?,
      subCategorySlug: json['subCategorySlug'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String,
      walletAmount: json['walletAmount'] as int?,
      thumbImage: json['thumb_image'] as String?,
      buyPrice: json['buy_price'] as String?,
      sellPrice: json['sell_price'] as String?,
      quantity: json['quantity'] as String?,
      timestamp: json['timestamp'] as String?,
      isWishlist: json['isWishlist'] as bool?,
    );
  }
}
