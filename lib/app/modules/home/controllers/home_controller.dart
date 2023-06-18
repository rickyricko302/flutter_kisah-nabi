import 'dart:convert';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisah_nabi/app/data/assets_color.dart';
import 'package:kisah_nabi/app/data/models/nabi_model.dart';

class HomeController extends GetxController {
  PageController pageController =
      PageController(initialPage: 2, viewportFraction: 0.9);
  RxInt index = 2.obs;
  RxList<NabiModel> model = RxList<NabiModel>([]);
  List<String> listImage = [
    'adam.png',
    'idris.png',
    'nuh.png',
    'hud.png',
    'sholeh.png',
    'ibrahim.png',
    'lut.png',
    'ismail.png',
    'ishaq.png',
    'yaqub.png',
    'yusuf.png',
    'ayyub.png',
    'syuaib.png',
    'musa.png',
    'musa.png',
    'musa.png',
    'musa.png',
    'harun.png',
    'dzulkifli.png',
    'daud.png',
    'sulaiman.png',
    'ilyas.png',
    'ilyasa.png',
    'yunus.png',
    'zakariya.png',
    'yahya.png',
    'isa.png',
    'muhammad.png',
  ];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    String data = await DefaultAssetBundle.of(Get.context!)
        .loadString("assets/kisahNabi.json");
    Iterable iterableData = jsonDecode(data);
    for (var element in iterableData) {
      model.add(NabiModel.fromJson(element));
    }
  }

  void showSearchable(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          "Cari Kisah Nabi",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
            fontSize: 20.0,
          ),
        ),
        data: List.generate(model.length,
            (index) => SelectedListItem(name: model[index].name ?? "")),
        listItemBuilder: (index) {
          return Text(
            model[index].name ?? "",
            style: GoogleFonts.poppins(),
          );
        },
        selectedItems: (List<dynamic> selectedList) async {
          await Future.delayed(Duration(seconds: 1), () {
            index.value = model
                .indexWhere((element) => element.name == selectedList[0].name);
            pageController.animateToPage(
                duration: const Duration(seconds: 1),
                index.value,
                curve: Curves.ease);
          });
        },
      ),
    ).showModal(context);
  }

  showBottomSheetHome(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(50 / 100),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Tentang Aplikasi Kisah Nabi",
                        style: GoogleFonts.poppins(
                            fontSize: 24.sp,
                            color: AssetsColor.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/ic_launcher.png"))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '"Hai semuanya, apa kabar? saya berharap semuanya menikmati penggunaan aplikasi saya dan semoga aplikasi ini dapat memberikan manfaat yang berarti bagi semuanya. Semua cerita ini saya dapatkan dari suatu web, Jika kamu menemukan kesalahan penulisan dalam cerita atau membutuhkan bantuan, jangan ragu untuk menghubungi saya".\n- Developer (Ricky Verdiyanto)\n',
                  style: GoogleFonts.poppins(
                      color: Colors.blueGrey, fontSize: 15.sp),
                ),
              ),
            ],
          );
        });
  }
}
