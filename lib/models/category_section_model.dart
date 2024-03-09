class CategorySectionsModel {
  final int id;
  final String title;
  final String image;
  final int position;
  final String slug;
  final int status;

  CategorySectionsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.position,
    required this.slug,
    required this.status,
  });

  factory CategorySectionsModel.fromMap(Map<String, dynamic> map) {
    return CategorySectionsModel(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      position: map['position'],
      slug: map['slug'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'position': position,
      'slug': slug,
      'status': status,
    };
  }
}
