import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kisah_nabi/app/modules/home/controllers/home_controller.dart';

import '../../../data/assets_color.dart';
import '../controllers/detail_story_controller.dart';

class DetailStoryView extends GetView<DetailStoryController> {
  const DetailStoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(97 / 100),
      body: SafeArea(
        child: DefaultTextStyle(
            style: GoogleFonts.poppins(),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: Material(
                            color: HexColor("#f7f7f7"),
                            elevation: controller.isTitleOverlap.value ? 1 : 0,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 20, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () => Get.back(),
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  Expanded(
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Obx(() => Text(
                                            controller.isTitleOverlap.value
                                                ? controller.model.name ?? ""
                                                : "Detail",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AssetsColor.primary,
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      controller.isFontShow.value = true;
                                    },
                                    icon: const Icon(
                                      Icons.format_size,
                                      color: Colors.blueGrey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        child: RawScrollbar(
                      controller: controller.scrollController,
                      radius: const Radius.circular(20),
                      child: SingleChildScrollView(
                        controller: controller.scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: (Colors.blueGrey)
                                              .withOpacity(10 / 100),
                                          blurRadius: 20,
                                          offset: const Offset(0, 8)),
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/${Get.find<HomeController>().listImage[controller.index]}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                controller.model.name ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.sp,
                                    color: const Color.fromARGB(
                                        255, 96, 125, 139)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 10),
                              child: Text(
                                "Nabi ke ${controller.urutan}",
                                style: TextStyle(color: AssetsColor.primary),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20, bottom: 20),
                              child: Obx(() => AutoSizeText(
                                    controller.model.description ?? '',
                                    style: TextStyle(
                                        fontSize:
                                            (controller.fontSize.value * 24).sp,
                                        color: Colors.blueGrey),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
                Obx(() => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: controller.isFontShow.value
                          ? Container(
                              width: double.infinity,
                              height: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(97 / 100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: (Colors.blueGrey)
                                            .withOpacity(10 / 100),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8)),
                                  ]),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 44,
                                      ),
                                      Text(
                                        "Ukuran Teks",
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey,
                                            fontSize: 18.sp),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        child: GestureDetector(
                                            onTap: () {
                                              controller.isFontShow.value =
                                                  false;
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.grey,
                                            )),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(() => Slider(
                                        value: controller.fontSize.value,
                                        onChanged: (value) {
                                          controller.fontSize.value = value;
                                          controller.box
                                              .write("font_size", value);
                                        },
                                        activeColor: AssetsColor.primary,
                                      ))
                                ],
                              ),
                            )
                          : null,
                    ))
              ],
            )),
      ),
    );
  }
}
