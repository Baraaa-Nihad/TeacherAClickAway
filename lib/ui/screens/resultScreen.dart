import 'package:eschool_teacher/ui/widgets/appBarSubTitleContainer.dart';
import 'package:eschool_teacher/ui/widgets/appBarTitleContainer.dart';
import 'package:eschool_teacher/ui/widgets/screenTopBackgroundContainer.dart';
import 'package:eschool_teacher/ui/widgets/svgButton.dart';
import 'package:eschool_teacher/utils/labelKeys.dart';
import 'package:eschool_teacher/utils/uiUtils.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  final double inBetweenDetailsPadding = 35;

  Widget _buildAppBar(BuildContext context) {
    return ScreenTopBackgroundContainer(
      heightPercentage: UiUtils.appBarMediumtHeightPercentage,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsets.only(
                    left: UiUtils.screenContentHorizontalPadding),
                child: SvgButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    svgIconUrl: UiUtils.getImagePath("back_icon.svg")),
              ),
            ),
            AppBarTitleContainer(
                boxConstraints: boxConstraints, title: "Student name"),
            AppBarSubTitleContainer(
                boxConstraints: boxConstraints,
                topPaddingPercentage: 0.1,
                subTitle: UiUtils.getTranslatedLabel(context, resultKey)),
            Positioned(
              bottom: -30,
              left: MediaQuery.of(context).size.width * (0.075),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.5),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Maths Chapter - 2 Unit Test",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "${UiUtils.getTranslatedLabel(context, dateKey)} : 05, Jul, 2022",
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.75),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0),
                    )
                  ],
                ),
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.075),
                          offset: Offset(2.5, 2.5),
                          blurRadius: 5,
                          spreadRadius: 0)
                    ],
                    color: Theme.of(context).scaffoldBackgroundColor),
                width: MediaQuery.of(context).size.width * (0.85),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildResultTitleContainer(
      {required BuildContext context,
      required BoxConstraints boxConstraints,
      required String title}) {
    return SizedBox(
      child: Text(
        "$title",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 13.5,
        ),
      ),
      width: boxConstraints.maxWidth * (0.25),
    );
  }

  Widget _buildResultValueDetailsContainer(
      {required String value,
      required BoxConstraints boxConstraints,
      required bool isSubject,
      required BuildContext buildContext}) {
    return SizedBox(
      child: Text(value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isSubject
                  ? Theme.of(buildContext).colorScheme.onPrimary
                  : Theme.of(buildContext).colorScheme.secondary,
              fontWeight: FontWeight.w400,
              fontSize: 13.0)),
      width: boxConstraints.maxWidth * (0.25),
    );
  }

  Widget _buildResultValueContainer(
      {required BuildContext context,
      required BoxConstraints boxConstraints,
      required String subject,
      required String obtainedMark,
      required String totalMark,
      required String grade}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildResultValueDetailsContainer(
              value: subject,
              boxConstraints: boxConstraints,
              isSubject: true,
              buildContext: context),
          _buildResultValueDetailsContainer(
              value: obtainedMark,
              boxConstraints: boxConstraints,
              isSubject: false,
              buildContext: context),
          _buildResultValueDetailsContainer(
              value: totalMark,
              boxConstraints: boxConstraints,
              isSubject: false,
              buildContext: context),
          _buildResultValueDetailsContainer(
              value: grade,
              boxConstraints: boxConstraints,
              isSubject: false,
              buildContext: context),
        ],
      ),
    );
  }

  Widget _buildResultValues(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            //
            _buildResultValueContainer(
                context: context,
                boxConstraints: boxConstraints,
                subject: "Maths",
                obtainedMark: "80",
                totalMark: "100",
                grade: "A"),
            _buildResultValueContainer(
                context: context,
                boxConstraints: boxConstraints,
                subject: "Gujarati",
                obtainedMark: "90",
                totalMark: "100",
                grade: "A+"),
            _buildResultValueContainer(
                context: context,
                boxConstraints: boxConstraints,
                subject: "Gujarati",
                obtainedMark: "90",
                totalMark: "100",
                grade: "A+"),
            _buildResultValueContainer(
                context: context,
                boxConstraints: boxConstraints,
                subject: "Gujarati",
                obtainedMark: "90",
                totalMark: "100",
                grade: "A+"),
            _buildResultValueContainer(
                context: context,
                boxConstraints: boxConstraints,
                subject: "Gujarati",
                obtainedMark: "90",
                totalMark: "100",
                grade: "A+"),
            SizedBox(
              height: 10.0,
            ),
          ],
        );
      }),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.075),
                offset: Offset(2.5, 2.5),
                blurRadius: 5,
                spreadRadius: 0),
          ],
          color: Theme.of(context).scaffoldBackgroundColor),
      width: MediaQuery.of(context).size.width * (0.85),
    );
  }

  Widget _buildResultTitles(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildResultTitleContainer(
                context: context,
                boxConstraints: boxConstraints,
                title: UiUtils.getTranslatedLabel(context, subKey)),
            _buildResultTitleContainer(
                context: context,
                boxConstraints: boxConstraints,
                title: UiUtils.getTranslatedLabel(context, marksKey)),
            _buildResultTitleContainer(
                context: context,
                boxConstraints: boxConstraints,
                title: UiUtils.getTranslatedLabel(context, totalKey)),
            _buildResultTitleContainer(
                context: context,
                boxConstraints: boxConstraints,
                title: UiUtils.getTranslatedLabel(context, gradeKey)),
          ],
        );
      }),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.075),
                offset: Offset(2.5, 2.5),
                blurRadius: 5,
                spreadRadius: 0)
          ],
          color: Theme.of(context).scaffoldBackgroundColor),
      width: MediaQuery.of(context).size.width * (0.85),
    );
  }

  Widget _buildObtainedMarksContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
          "${UiUtils.getTranslatedLabel(context, obtainedMarksKey)}  :  370/600",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 15)),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.075),
                offset: Offset(2.5, 2.5),
                blurRadius: 5,
                spreadRadius: 0)
          ],
          color: Theme.of(context).scaffoldBackgroundColor),
      width: MediaQuery.of(context).size.width * (0.85),
    );
  }

  Widget _buildPercentageAndGradeTitleAndValueContainer(
      {required BuildContext context,
      required String title,
      required String value}) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.75),
                fontWeight: FontWeight.w400,
                fontSize: 13.0),
            textAlign: TextAlign.left),
        SizedBox(
          height: 5.0,
        ),
        Text(
          value,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w500,
              fontSize: 15.0),
        )
      ],
    );
  }

  Widget _buildPercentageAndGradeContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildPercentageAndGradeTitleAndValueContainer(
              context: context,
              title: UiUtils.getTranslatedLabel(context, gradeKey),
              value: "A+"),
          _buildPercentageAndGradeTitleAndValueContainer(
              context: context,
              title: UiUtils.getTranslatedLabel(context, percentageKey),
              value: "89%"),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background),
      width: MediaQuery.of(context).size.width * (0.85),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: UiUtils.getScrollViewTopPadding(
                      context: context,
                      appBarHeightPercentage:
                          UiUtils.appBarMediumtHeightPercentage)),
              child: Column(
                children: [
                  SizedBox(
                    height: inBetweenDetailsPadding,
                  ),
                  _buildResultTitles(context),
                  SizedBox(
                    height: inBetweenDetailsPadding,
                  ),
                  _buildResultValues(context),
                  SizedBox(
                    height: inBetweenDetailsPadding,
                  ),
                  _buildObtainedMarksContainer(context),
                  SizedBox(
                    height: inBetweenDetailsPadding,
                  ),
                  _buildPercentageAndGradeContainer(context),
                  SizedBox(
                    height: inBetweenDetailsPadding,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _buildAppBar(context),
          ),
        ],
      ),
    );
  }
}
