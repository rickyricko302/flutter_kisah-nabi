import 'package:get/get.dart';

import '../controllers/detail_youtube_controller.dart';

class DetailYoutubeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailYoutubeController>(
      () => DetailYoutubeController(),
    );
  }
}
