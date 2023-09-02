import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kisah_nabi/app/data/status.dart';

import '../../../data/models/video_model.dart';

class YoutubeController extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  RxList<VideoModel> videoList = <VideoModel>[].obs;
  Rx<Status> status = Status.LOADING.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      status.value = Status.LOADING;
      print('object');
      var data = await fireStore.collection('video_kisah').get();
      print('object');
      videoList.clear();
      for (var element in data.docs) {
        videoList.add(VideoModel.fromJson(element.data()));
      }
      status.value = Status.SUCCESS;
    } catch (e) {
      print(e);
      status.value = Status.ERROR;
    }
  }
}
