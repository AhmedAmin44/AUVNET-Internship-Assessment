import 'package:hive/hive.dart';
import '../models/home_model.dart';

abstract class HomeLocalDataSource {
  HomeModel? getCachedHomeData();
  Future<void> cacheHomeData(HomeModel data);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box box;

  HomeLocalDataSourceImpl(this.box);

  @override
  HomeModel? getCachedHomeData() {
    final json = box.get('homeData');
    if (json != null) {
      return HomeModel.fromMap(Map<String, dynamic>.from(json));
    }
    return null;
  }

  @override
  Future<void> cacheHomeData(HomeModel data) async {
    await box.put('homeData', data.toMap());
  }
}
