import 'package:hive/hive.dart';
import '../../domain/entities/service_entity.dart';

part 'service_model.g.dart';

@HiveType(typeId: 2)
class ServiceModel extends ServiceEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final String duration;

  @HiveField(4)
  final String discount;

  ServiceModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.discount,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          duration: duration,
          discount: discount,
        );

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      duration: map['duration'],
      discount: map['discount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'duration': duration,
      'discount': discount,
    };
  }
}
