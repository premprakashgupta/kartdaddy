
class MasterCategoryModel {
  final int id;
  final String name;
  final String slug;
  MasterCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  factory MasterCategoryModel.fromMap(Map<String, dynamic> map) {
    return MasterCategoryModel(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
    );
  }
}
