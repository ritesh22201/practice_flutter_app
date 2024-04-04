import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/previous_year_question_controller.dart';
import 'package:neet_flutter_app/utils/miscellaneous.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class PastYearsPaperView extends StatelessWidget{
  const PastYearsPaperView({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<PreviousYearQuesController>(
      init: PreviousYearQuesController(),
      builder:(PreviousYearQuesController previousYearQuesController) => Container(
        color: ColorConstants.lightGrey,
        padding: EdgeInsets.only(left: 16.px, right: 16.px, top: 25.px),
        child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: previousYearQuesController.papersData.length,
              itemBuilder: (context, index) {
                return Container(
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
                        padding: EdgeInsets.only(left: index == 0 ? 4.px : 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 280.px,
                              child: AppText(
                                previousYearQuesController.papersData[index]['test_name'],
                                fontWeight: FontWeight.w500,
                                fontSize: 15.px,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 5.px,),
                            SizedBox(
                              width: 280.px,
                              child: AppText(
                                dateFormatter(previousYearQuesController.papersData[index]['date']),
                                color: ColorConstants.appGrey,
                                fontSize: 12.px,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 8.px,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 39.5.w,
                                  child: OutlinedButton(
                                    onPressed: (){}, 
                                    style: OutlinedButton.styleFrom(                                   
                                      side: const BorderSide(
                                        color: ColorConstants.appGreen
                                      ),
                                    ),
                                    child: AppText('Give Test', color: ColorConstants.appGreen, fontWeight: FontWeight.w500,)
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                SizedBox(
                                  width: 39.5.w,
                                  child: OutlinedButton(
                                    onPressed: (){}, 
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 232, 175, 4)
                                      )
                                    ),
                                    child: AppText('Practice', color: const Color.fromARGB(255, 232, 175, 4), fontWeight: FontWeight.w500,)
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
      ),
    );
  }
}