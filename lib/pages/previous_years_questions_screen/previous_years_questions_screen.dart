import 'package:flutter/material.dart';
import 'package:neet_flutter_app/constants/color_constants.dart';
import 'package:neet_flutter_app/generated/l10n.dart';
import 'package:neet_flutter_app/pages/previous_years_questions_screen/past_years_paper_view.dart';
import 'package:neet_flutter_app/pages/previous_years_questions_screen/subject_tab_view.dart';
import 'package:neet_flutter_app/widgets/custom_app_bar.dart';
import 'package:neet_flutter_app/widgets/custom_text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


enum TabItems{subjects, papers, mocks}

class PreviousYearQuestionsScreen extends StatelessWidget {
  const PreviousYearQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                      AppText(TabItems.mocks.name[0].toUpperCase() + TabItems.mocks.name.substring(1), fontWeight: FontWeight.w500, color: ColorConstants.lightGrey),
                    ], 
                  ),
                )
              ],
            )),
        body: TabBarView(
          children: [
            const SubjectTabView(),
            const PastYearsPaperView(),
            AppText('Content for tab 3'),
          ],
        ),
      ),
    );
  }
}
