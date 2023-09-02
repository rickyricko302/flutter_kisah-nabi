import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisah_nabi/app/data/status.dart';

import '../../../data/assets_color.dart';
import '../controllers/youtube_controller.dart';
import 'widgets/video_item.dart';

class YoutubeView extends GetView<YoutubeController> {
  const YoutubeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(97 / 100),
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
                        "Video Islami",
                        style: TextStyle(
                            color: AssetsColor.primary,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.help_outline,
                        color: AssetsColor.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () async {
                  controller.getData();
                },
                child: LayoutBuilder(builder: (context, constraint) {
                  return Container(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Obx(() {
                        if (controller.status.value == Status.LOADING) {
                          return ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraint.maxHeight),
                              child: const Center(
                                  child: CircularProgressIndicator()));
                        } else if (controller.status.value == Status.SUCCESS) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 10);
                            },
                            itemBuilder: (context, index) {
                              return VideoItem(
                                  model: controller.videoList[index]);
                            },
                            itemCount: controller.videoList.length,
                          );
                        } else {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.refresh)),
                                Text(
                                  "Gagal mendapatkan data",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                    ),
                  );
                }),
              ))
            ]))));
  }
}
