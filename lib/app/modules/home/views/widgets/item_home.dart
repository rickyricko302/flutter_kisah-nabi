import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisah_nabi/app/data/models/nabi_model.dart';

import '../../../../data/assets_color.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';

class ItemHome extends StatelessWidget {
  const ItemHome(
      {super.key,
      required this.controller,
      required this.index,
      required this.model});

  final HomeController controller;
  final int index;
  final NabiModel model;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: index == controller.index.value ? 0 : 30,
            bottom: index == controller.index.value ? 30 : 0,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: (index == controller.index.value
                            ? Colors.blueAccent
                            : Colors.blueGrey)
                        .withOpacity(15 / 100),
                    blurRadius: 24,
                    offset: const Offset(0, -8))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage("assets/${controller.listImage[index]}")),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Chip(
                    label: Text(
                        "Nabi ke ${index <= 13 ? (index + 1) : (index == 14 || index == 15 || index == 16) ? 14 : index - 2}",
                        style: GoogleFonts.poppins(color: Colors.blueGrey))),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  model.name ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: const Color.fromARGB(255, 96, 125, 139)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        model.description ?? "",
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.blueGrey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 20.w,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(85 / 100),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: SizedBox(
                  height: 48.w,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AssetsColor.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: () {
                        Get.toNamed(Routes.DETAIL_STORY, arguments: {
                          "model": model,
                          'index': index,
                          'urutan': index <= 13
                              ? (index + 1)
                              : (index == 14 || index == 15 || index == 16)
                                  ? 14
                                  : index - 2
                        });
                      },
                      child: Text(
                        "Baca Kisahnya",
                        style: GoogleFonts.poppins(),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
