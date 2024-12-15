import 'package:dalel/core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagepath;
  final String title;
  final String subtitle;

  OnBoardingModel(
      {required this.imagepath, required this.title, required this.subtitle});
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
      imagepath: Assets.imagesOnBoarding,
      title: 'Explore The history with Dalel in smart way',
      subtitle:
          'Using our app’s history libraries you can find many historical periods'),
  OnBoardingModel(
      imagepath: Assets.imagesOnBoarding2,
      title: 'From every placeon earth',
      subtitle: 'A big variety of ancient placesfrom all over the world'),
  OnBoardingModel(
      imagepath: Assets.imagesOnBoarding3,
      title: 'Using modern AI technology for better user experience',
      subtitle:
          'AI provide recommendations and helps you to continue the search journey')
];
