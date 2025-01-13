import 'dart:convert';

// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  int? status;
  int? categoriesCount;
  List<Category>? categories;

  CategoryModel({
    this.status,
    this.categoriesCount,
    this.categories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        categoriesCount: json["categories_count"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "categories_count": categoriesCount,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? title;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Category({
    this.id,
    this.title,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
