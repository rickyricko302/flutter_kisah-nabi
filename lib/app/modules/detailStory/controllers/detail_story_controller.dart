import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kisah_nabi/app/data/models/nabi_model.dart';

class DetailStoryController extends GetxController {
  RxList<dynamic> languages = [].obs;
  RxString playing = "".obs;
  final NabiModel model = Get.arguments['model'];
  final index = Get.arguments['index'];
  final urutan = Get.arguments['urutan'];
  RxDouble fontSize = (7 / 10).obs;
  RxBool isFontShow = false.obs;
  RxBool isTitleOverlap = false.obs;
  GetStorage box = GetStorage();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    if (box.read("font_size") != null) {
      fontSize.value = box.read("font_size");
    }
    scrollController.addListener(() {
      // print(scrollController.position.pixels.ceil());
      if (scrollController.position.pixels.ceil() > 263 &&
          !isTitleOverlap.value) {
        isTitleOverlap.value = true;
      } else if (scrollController.position.pixels.ceil() < 263 &&
          isTitleOverlap.value) {
        isTitleOverlap.value = false;
      }
    });
  }
}
