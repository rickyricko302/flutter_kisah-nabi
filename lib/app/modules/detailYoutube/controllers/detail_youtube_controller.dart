import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/video_model.dart';

class DetailYoutubeController extends GetxController {
  late final PodPlayerController podController;
  final VideoModel model = Get.arguments['model'];
  @override
  void onInit() {
    podController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
          model.url ?? "",
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: false,
          ),
        ),
        podPlayerConfig: const PodPlayerConfig(videoQualityPriority: [360]))
      ..initialise();
    super.onInit();
  }

  openChannel() async {
    await launchUrl(Uri.parse(model.channelUrl ?? ""),
        mode: LaunchMode.externalApplication);
  }

  @override
  void onClose() {
    podController.dispose();
    super.onClose();
  }
}
