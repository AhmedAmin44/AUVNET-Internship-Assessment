import 'category_entity.dart';
import 'restaurant_entity.dart';
import 'service_entity.dart';

class HomeEntity {
  final List<ServiceEntity> services;
  final List<CategoryEntity> categories;
  final List<RestaurantEntity> restaurants;

  HomeEntity({
    required this.services,
    required this.categories,
    required this.restaurants,
  });
}
