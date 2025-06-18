import 'package:auvnet_internship_assessment/core/utils/app_images.dart';

class OnBoardingModel{
  final String imagePath;
  final String title;
  final String subTitle;
  OnBoardingModel( {required this.imagePath,required this.title, required this.subTitle,});
}
List <OnBoardingModel> onBoardingData=[
  OnBoardingModel(imagePath: Images.appLogo, title: "all-in-one delivery ", subTitle: "Order groceries, medicines, and meals\n delivered straight to your door"),
  OnBoardingModel(imagePath: Images.appLogo, title: 'User-to-User Delivery', subTitle: 'Send or receive items from other users quickly\n and easily'),
  OnBoardingModel(imagePath: Images.appLogo, title: 'Sales & Discounts', subTitle: 'Discover exclusive sales and deals every day'),
];