import 'package:hive/hive.dart';
import '../../domain/entities/category_entity.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends CategoryEntity {
  @HiveField(0)
  final String imageUrl;

  CategoryModel({
    required this.imageUrl,
  }) : super( imageUrl: imageUrl);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }
}
