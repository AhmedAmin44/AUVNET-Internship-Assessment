import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> fetchHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSourceImpl(this.firestore);

  @override
  Future<HomeModel> fetchHomeData() async {
    final services = await firestore.collection('services').get();
    final categories = await firestore.collection('banners').get();
    final restaurants = await firestore.collection('restaurants').get();

    return HomeModel.fromFirebase(services, categories, restaurants);
  }
}
