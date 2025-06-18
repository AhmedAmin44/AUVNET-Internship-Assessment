import 'package:auvnet_internship_assessment/core/databases/cache/cache_helper.dart';
import 'package:auvnet_internship_assessment/core/router/routers.dart';
import 'package:auvnet_internship_assessment/core/serveces/service_locator.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/category_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/home_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/restaurant_model.dart';
import 'package:auvnet_internship_assessment/features/home/data/models/service_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();

  Hive.registerAdapter(HomeModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ServiceModelAdapter());
  Hive.registerAdapter(RestaurantModelAdapter());

  await Hive.openBox('home');

  setupServiceLocator();
  await getIt<CacheHelper>().init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
