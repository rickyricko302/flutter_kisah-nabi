import 'package:get/get.dart';

import '../modules/detailStory/bindings/detail_story_binding.dart';
import '../modules/detailStory/views/detail_story_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STORY,
      page: () => const DetailStoryView(),
      binding: DetailStoryBinding(),
    ),
  ];
}
