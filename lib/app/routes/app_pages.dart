import 'package:get/get.dart';

import '../modules/detailStory/bindings/detail_story_binding.dart';
import '../modules/detailStory/views/detail_story_view.dart';
import '../modules/detailYoutube/bindings/detail_youtube_binding.dart';
import '../modules/detailYoutube/views/detail_youtube_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/youtube/bindings/youtube_binding.dart';
import '../modules/youtube/views/youtube_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STORY,
      page: () => const DetailStoryView(),
      binding: DetailStoryBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBE,
      page: () => const YoutubeView(),
      binding: YoutubeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_YOUTUBE,
      page: () => const DetailYoutubeView(),
      binding: DetailYoutubeBinding(),
    ),
  ];
}
