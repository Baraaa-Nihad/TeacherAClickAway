import 'package:eschool_teacher/ui/widgets/customAppbar.dart';
import 'package:eschool_teacher/ui/widgets/customRoundedButton.dart';
import 'package:eschool_teacher/utils/labelKeys.dart';
import 'package:eschool_teacher/utils/uiUtils.dart';
import 'package:flutter/material.dart';

class AddResultScreen extends StatefulWidget {
  const AddResultScreen({Key? key}) : super(key: key);

  @override
  State<AddResultScreen> createState() => _AddResultScreenState();
}

class _AddResultScreenState extends State<AddResultScreen> {
  late List<TextEditingController> obtainedMarksTextEditingController = [];

  final int totalSubjects = 5;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < totalSubjects; i++) {
      obtainedMarksTextEditingController.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < totalSubjects; i++) {
      obtainedMarksTextEditingController[i].dispose();
    }
    super.dispose();
  }

  Widget _buildSubjectNameWithObtainedMarksContainer(
      {required int index, required String subjectName}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //
            Container(
              alignment: AlignmentDirectional.centerStart,
              width: boxConstraints.maxWidth * (0.5),
              child: Text(
                subjectName,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5))),
              width: boxConstraints.maxWidth * (0.3),
              height: 35,
              padding: EdgeInsets.only(bottom: 6),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.0,
                ),
                controller: obtainedMarksTextEditingController[index],
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              width: boxConstraints.maxWidth * (0.2),
              child: Text(
                "100",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  TextStyle _getResultTitleTextStyle() {
    return TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
        fontWeight: FontWeight.w600,
        fontSize: 12.0);
  }

  Widget _buildAppbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomAppBar(
        title: "Student name",
        subTitle: UiUtils.getTranslatedLabel(context, addResultKey),
      ),
    );
  }

  Widget _buildResultTitleDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 50,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              width: boxConstraints.maxWidth * (0.5),
              child: Text(
                UiUtils.getTranslatedLabel(context, subjectsKey),
                style: _getResultTitleTextStyle(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: boxConstraints.maxWidth * (0.3),
              child: Text(
                UiUtils.getTranslatedLabel(context, obtainedKey),
                style: _getResultTitleTextStyle(),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.centerEnd,
              width: boxConstraints.maxWidth * (0.2),
              child: Text(
                UiUtils.getTranslatedLabel(context, totalKey),
                style: _getResultTitleTextStyle(),
              ),
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
                spreadRadius: 1)
          ],
          color: Theme.of(context).scaffoldBackgroundColor),
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildSubjectListContainer() {
    final List<Widget> children = [];
    for (var i = 0; i < totalSubjects; i++) {
      children.add(_buildSubjectNameWithObtainedMarksContainer(
          index: i, subjectName: "Subhect name"));
    }
    return Column(
      children: children,
    );
  }

  Widget _buildSubmitButton() {
    return CustomRoundedButton(
        onTap: () {},
        height: UiUtils.bottomSheetButtonHeight,
        widthPercentage: UiUtils.bottomSheetButtonWidthPercentage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        buttonTitle: UiUtils.getTranslatedLabel(context, submitResultKey),
        showBorder: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: UiUtils.getScrollViewTopPadding(
                    context: context,
                    appBarHeightPercentage:
                        UiUtils.appBarSmallerHeightPercentage),
                left: MediaQuery.of(context).size.width * (0.075),
                right: MediaQuery.of(context).size.width * (0.075),
              ),
              child: Column(
                children: [
                  //
                  _buildResultTitleDetails(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (0.04),
                  ),
                  _buildSubjectListContainer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * (0.1),
                  ),
                  _buildSubmitButton(),
                ],
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          _buildAppbar(),
        ],
      ),
    );
  }
}
