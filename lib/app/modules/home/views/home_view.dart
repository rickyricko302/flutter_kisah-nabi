import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisah_nabi/app/data/assets_color.dart';
import 'package:kisah_nabi/app/modules/home/views/widgets/item_home.dart';
import 'package:kisah_nabi/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(97 / 100),
      body: DefaultTextStyle(
        style: GoogleFonts.poppins(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.showBottomSheetHome(context);
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        "Kisah Nabi",
                        style: TextStyle(
                            color: AssetsColor.primary,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.YOUTUBE);
                        },
                        icon: SvgPicture.asset(
                          'assets/ic_youtube.svg',
                          colorFilter: ColorFilter.mode(
                              AssetsColor.primary, BlendMode.srcIn),
                        )),
                    IconButton(
                      onPressed: () {
                        controller.showSearchable(context);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
              // Obx(() => Text(
              //       "${controller.index.value <= 13 ? (controller.index.value + 1) : (controller.index.value == 14 || controller.index.value == 15 || controller.index.value == 16) ? 14 : controller.index.value - 2}/${25}",
              //       style: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.normal),
              //     )),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  // color: Colors.blueAccent,
                  child: Obx(() => PageView.builder(
                        controller: controller.pageController,
                        itemCount: controller.model.length,
                        onPageChanged: (page) {
                          controller.index.value = page;
                        },
                        itemBuilder: (context, index) {
                          // print(index);
                          return ItemHome(
                            controller: controller,
                            index: index,
                            model: controller.model[index],
                          );
                        },
                        pageSnapping: true,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
