import 'package:eschool_teacher/app/routes.dart';
import 'package:eschool_teacher/utils/labelKeys.dart';
import 'package:eschool_teacher/utils/uiUtils.dart';
import 'package:flutter/material.dart';


class ResultsContainer extends StatefulWidget {
  ResultsContainer({Key? key}) : super(key: key);

  @override
  State<ResultsContainer> createState() => _ResultsContainerState();
}

class _ResultsContainerState extends State<ResultsContainer> {
  Widget _buildResultDetainsContainer(bool isResultGenerated) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (isResultGenerated) {
            Navigator.of(context).pushNamed(Routes.result);
          } else {
            Navigator.of(context).pushNamed(Routes.addResult);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * (0.075)),
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.5),
          width: MediaQuery.of(context).size.width,
          height: isResultGenerated ? 80.0 : 90,
          child: LayoutBuilder(builder: (context, boxConstraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: boxConstraints.maxWidth * (0.55),
                      child: Text(
                        "Unit Exam",
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.75),
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0),
                      ),
                    ),
                    SizedBox(
                      width: boxConstraints.maxWidth * (0.45),
                      child: Text(
                        "Date : 05, Jul, 2022",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.75),
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                isResultGenerated
                    ? Row(
                        children: [
                          Text(
                            "Grade - A+",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0),
                          ),
                          Spacer(),
                          Text(
                            "Percentage : 95%",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0),
                          ),
                        ],
                      )
                    : Container(
                        padding: EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary)),
                        alignment: AlignmentDirectional.center,
                        width: boxConstraints.maxWidth * (0.35),
                        child: Text(
                            UiUtils.getTranslatedLabel(context, addResultKey),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0)),
                      ),
              ],
            );
          }),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
          padding: EdgeInsets.only(
              top: UiUtils.getScrollViewTopPadding(
                  context: context,
                  appBarHeightPercentage:
                      UiUtils.appBarBiggerHeightPercentage)),
          itemCount: 2,
          itemBuilder: (context, index) {
            return _buildResultDetainsContainer(index % 2 == 0);
          }),
    );
  }
}
