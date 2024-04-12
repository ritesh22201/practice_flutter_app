import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/controllers/home_page_controller.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/pages/home/home_page_helper.dart';
import 'package:neet_flutter_app/pages/previous_years_questions_screen/past_years_paper_view.dart';
import 'package:neet_flutter_app/pages/previous_years_questions_screen/subject_tab_view.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


enum TabItems{ subjects, papers }

class PreviousYearQuestionsScreen extends StatelessWidget {
  const PreviousYearQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(108.px),
            child: Column(
              children: [
                MyAppBar(
                  appBarHeight: 65.px,
                  appBarTitle: S.of(context).previousYearText,
                  appBarColor: ColorConstants.appPrimaryColor,
                  textColor: ColorConstants.appWhite,
                ),
                Container(
                padding: const EdgeInsets.all(8.0),
                color: ColorConstants.appPrimaryColor,
                  child: TabBar(
                    dividerColor: ColorConstants.appPrimaryColor,
                    indicatorColor: ColorConstants.lightGrey, 
                    tabs: [
                      AppText(TabItems.subjects.name[0].toUpperCase() + TabItems.subjects.name.substring(1), fontWeight: FontWeight.w500, color: ColorConstants.lightGrey),
                      AppText(TabItems.papers.name[0].toUpperCase() + TabItems.papers.name.substring(1), fontWeight: FontWeight.w500, color: ColorConstants.lightGrey),
                    ], 
                  ),
                )
              ],
            )),
        body: const TabBarView(
          children: [
            SubjectTabView(),
            PastYearsPaperView(),
          ],
        ),
        bottomNavigationBar: GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (HomePageController controller) {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: ColorConstants.appGrey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
                child: Row(
                  children: List.generate(
                    controller.pagesName.length,
                    (index) =>
                        BottomBarItems(index: index, controller: controller),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
