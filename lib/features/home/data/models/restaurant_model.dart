import 'package:hive/hive.dart';
import '../../domain/entities/restaurant_entity.dart';

part 'restaurant_model.g.dart';

@HiveType(typeId: 3)
class RestaurantModel extends RestaurantEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String logoUrl;

  @HiveField(3)
  final double distance;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.distance,
  }) : super(
          id: id,
          name: name,
          logoUrl: logoUrl,
          distance: distance,
        );

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id'],
      name: map['name'],
      logoUrl: map['logoUrl'],
      distance: (map['distance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'distance': distance,
    };
  }
}
