import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/models/video_model.dart';
import '../../../../routes/app_pages.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.model});
  final VideoModel model;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.DETAIL_YOUTUBE, arguments: {'model': model});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey.withOpacity(10 / 100),
                      blurRadius: 24,
                      offset: const Offset(0, 0))
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://img.youtube.com/vi/${(model.url ?? "").replaceAll('https://youtu.be/', '').replaceAll("https://www.youtube.com/watch?v=", "")}/0.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                model.title ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                model.desc ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12.sp),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
