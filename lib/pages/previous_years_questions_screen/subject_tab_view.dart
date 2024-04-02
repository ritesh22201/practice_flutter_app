import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/constants/neet_assets.dart';
import 'package:neet_flutter_app/controllers/previous_year_question_controller.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubjectTabView extends StatelessWidget {
  const SubjectTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreviousYearQuesController>(
      init: PreviousYearQuesController(),
      builder: (PreviousYearQuesController previousYearQuesController) =>
          Container(
            color: ColorConstants.lightGrey,
        padding: EdgeInsets.only(left: 16.px, right: 16.px, top: 25.px),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: previousYearQuesController.subjectList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.px),
                  decoration: BoxDecoration(
                    color: ColorConstants.appWhite,
                    borderRadius: BorderRadius.circular(8.px),
                    boxShadow: [
                      BoxShadow(
                          color: ColorConstants.appGrey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1))
                    ],
                  ),
                  padding: EdgeInsets.all(10.px),
                  child: Row(
                    children: [
                      Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 6.px)
                            : EdgeInsets.zero,
                        child: Lottie.asset(
                          index == 0
                              ? NeetAssets.physicsAnimation
                              : index == 1
                                  ? NeetAssets.chemistryAnimation
                                  : index == 2
                                      ? NeetAssets.botanyAnimation
                                      : NeetAssets.zoologyAnimation,
                          width: index == 0 ? Device.width/10 : Device.width/8,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20.px,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 4.px : 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              previousYearQuesController.subjectList[index],
                              fontWeight: FontWeight.bold,
                              fontSize: 16.px,
                            ),
                            // SizedBox(height: 5.px,),
                            SizedBox(
                              width: 65.w,
                              child: AppText(
                                'Detailed topic-wise test series and practice sets.',
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
              );
            }),
      ),
    );
  }
}
