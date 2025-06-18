// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 0;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      services: (fields[0] as List).cast<ServiceModel>(),
      categories: (fields[1] as List).cast<CategoryModel>(),
      restaurants: (fields[2] as List).cast<RestaurantModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.services)
      ..writeByte(1)
      ..write(obj.categories)
      ..writeByte(2)
      ..write(obj.restaurants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
