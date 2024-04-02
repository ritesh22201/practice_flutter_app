import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/routes/route_helper.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:neet_flutter_app/widgets/home_app_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> homeCategoryItems = [
      S.of(context).previousYearText,
      S.of(context).attemptedTestText,
      S.of(context).syllabusText,
      S.of(context).bookmarkedQuesText,
    ];

    List<String> homeCategorySubItems = [
      S.of(context).previousYearSubText,
      S.of(context).attemptedTestSubText,
      S.of(context).syllabusSubText,
      S.of(context).bookmarkedQuesSubText,
    ];

    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (HomePageController homePageController) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(100.w, 65.px), child: const HomeAppBar()),
        body: Container(
          color: ColorConstants.lightGrey,
          padding: EdgeInsets.symmetric(horizontal: 13.px),
          child: Column(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              CarouselSlider(
                  items: homePageController.homeCarouselImgs
                      .map((item) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.px),
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: 100.w,
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                  )),
              SizedBox(
                height: 30.px,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homePageController.homeCategoryName.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          homeCategoryItems[index] == S.of(context).previousYearText ? Get.toNamed(RouteHelper.getPreviousYearQuesScreen()) : null;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorConstants.appWhite,
                              borderRadius: BorderRadius.circular(8.px),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        ColorConstants.appGrey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1))
                              ]),
                          padding: EdgeInsets.all(10.px),
                          child: Row(
                            children: [
                              Padding(
                                padding: index == 0 ? EdgeInsets.only(left: 6.px) : EdgeInsets.zero,
                                child: Lottie.asset(
                                  index == 0
                                      ? NeetAssets.pastYearAnimation
                                      : index == 1
                                          ? NeetAssets.testAnimation
                                          : index == 2
                                              ? NeetAssets.syllabusAnimation
                                              : NeetAssets.bookmarkAnimation,
                                  width: index == 0 ? 40.px : 50.px,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 20.px,),
                              Padding(
                                padding: EdgeInsets.only(left: index == 0 ? 4.px : 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      homeCategoryItems[index],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.px,
                                    ),
                                    // SizedBox(height: 5.px,),
                                    SizedBox(
                                      width: 65.w,
                                      child: AppText(
                                        homeCategorySubItems[index],
                                        color: ColorConstants.appGrey,
                                        fontSize: 12.px,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.px,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
