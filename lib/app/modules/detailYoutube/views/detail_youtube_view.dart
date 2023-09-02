import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pod_player/pod_player.dart';

import '../../../data/assets_color.dart';
import '../controllers/detail_youtube_controller.dart';

class DetailYoutubeView extends GetView<DetailYoutubeController> {
  const DetailYoutubeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTextStyle(
            style: GoogleFonts.poppins(color: AssetsColor.primary),
            child: SafeArea(
                child: Column(children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        "Memutar Video",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AssetsColor.primary,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PodVideoPlayer(controller: controller.podController),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.model.title ?? "",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey.withOpacity(30 / 100)),
                                bottom: BorderSide(
                                    color: Colors.grey.withOpacity(30 / 100)))),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                controller.model.channelThumb ?? "",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                controller.model.channelName ?? "",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.openChannel();
                                },
                                child: Text(
                                  "Lihat Channel",
                                  style: TextStyle(color: AssetsColor.primary),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.model.desc ?? "",
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ))
            ]))));
  }
}
