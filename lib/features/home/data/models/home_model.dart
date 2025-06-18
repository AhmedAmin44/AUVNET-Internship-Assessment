import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/home_entity.dart';
import 'category_model.dart';
import 'restaurant_model.dart';
import 'service_model.dart';

part 'home_model.g.dart';

@HiveType(typeId: 0)
class HomeModel extends HomeEntity {
  @HiveField(0)
  final List<ServiceModel> services;

  @HiveField(1)
  final List<CategoryModel> categories;

  @HiveField(2)
  final List<RestaurantModel> restaurants;

  HomeModel({
    required this.services,
    required this.categories,
    required this.restaurants,
  }) : super(
          services: services,
          categories: categories,
          restaurants: restaurants,
        );

  factory HomeModel.fromFirebase(
    QuerySnapshot servicesSnap,
    QuerySnapshot categoriesSnap,
    QuerySnapshot restaurantsSnap,
  ) {
    final services = servicesSnap.docs
        .map((doc) => ServiceModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    final categories = categoriesSnap.docs
        .map((doc) => CategoryModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    final restaurants = restaurantsSnap.docs
        .map((doc) => RestaurantModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    return HomeModel(
      services: services,
      categories: categories,
      restaurants: restaurants,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'services': services.map((e) => e.toMap()).toList(),
      'categories': categories.map((e) => e.toMap()).toList(),
      'restaurants': restaurants.map((e) => e.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      services: (map['services'] as List)
          .map((e) => ServiceModel.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      categories: (map['banners'] as List)
          .map((e) => CategoryModel.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
      restaurants: (map['restaurants'] as List)
          .map((e) => RestaurantModel.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}
