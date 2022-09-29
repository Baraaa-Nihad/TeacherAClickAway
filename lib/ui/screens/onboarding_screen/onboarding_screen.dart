import 'package:eschool_teacher/app/routes.dart';
import 'package:eschool_teacher/ui/styles/colors.dart';
import 'package:eschool_teacher/ui/widgets/onboarding_parts.dart';
import 'package:eschool_teacher/ui/widgets/onboarding_selected_page.dart';
import 'package:eschool_teacher/utils/labelKeys.dart';
import 'package:eschool_teacher/utils/uiUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/models/onboardingScreensModel.dart';
import '../../../data/repositories/settingsRepository.dart';
import '../../../utils/api.dart';
import '../form/stteper_screen.dart';
import 'package:http/http.dart' as http;
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);


  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnboardingScreen>? onBoardingScreensData = [] ;

  late Future futureMethod;
  late PageController _pageController;
  int _selectedPage = 0;
  bool isArabic = SettingsRepository().getCurrentLanguageCode() == "ar" ;

  @override
  void initState() {
    futureMethod = getData();

    super.initState();
    _pageController = PageController();
  }

  Future getData() async {
    await getOnBoardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: futureBody());
  }

  Widget futureBody() {
    return FutureBuilder(
        future: futureMethod,
        // ignore: missing_return
        builder: (context, snapshots) {
          if (snapshots.hasError) {
            print("${snapshots.error}");
            return SizedBox();
          }
          switch (snapshots.connectionState) {
            case ConnectionState.waiting:
              EasyLoading.show(status: null);
              return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircularProgressIndicator(),
                      Text(
                        // "${translator.translate('loading')}",
                        "",
                      )
                    ],
                  ));

            case ConnectionState.done:
              EasyLoading.dismiss();
              return SafeArea(
                // child: oldBuildColumn(context),
                child: newBuildColumn(context),
              );

            case ConnectionState.none:
            // TODO: Handle this case.
              return SizedBox();
              break;
            case ConnectionState.active:
            // TODO: Handle this case.
              return SizedBox();
              break;
          }
        });
  }

  Column newBuildColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                _selectedPage = value;
              });
            },
            // children: staticData(context),
            children: List.generate(onBoardingScreensData?.length.toInt() ?? 0, (index) {

              return  OnBoardingPartsAll(
                title: isArabic ? onBoardingScreensData![index].titleAr :onBoardingScreensData![index].title,
                subtitle: isArabic ? onBoardingScreensData![index].subTitleAr : onBoardingScreensData![index].subTitle,
                image: '${onBoardingScreensData![index].image}',
              );
            }),
          ),
        ),
        Container(
          height: 20,
          child: dotsApi(),
          // child: dotsStatic(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20 ),
          child: ElevatedButton(
            onPressed: () {
              if (_selectedPage == (onBoardingScreensData?.length.toInt() ?? 0) -1) {
                // Navigator.of(context).pushReplacementNamed(Routes.login);
                Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                  return StepperScreen();
                }));
              } else {
                _pageController.nextPage(
                    duration: Duration(milliseconds:500), curve: Curves.easeInCubic);
              }
            },
            child: Text(
              _selectedPage == (onBoardingScreensData?.length.toInt() ?? 0) -1
                  ? UiUtils.getTranslatedLabel(context, getStartedKey)
                  : UiUtils.getTranslatedLabel(context, nextKey),
              style: TextStyle(color: Colors.white, fontSize: 20 ),
            ),
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(300, 44)),
                backgroundColor: MaterialStateProperty.all(primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }



  Future  getOnBoardingScreen() async {
    var request = http.Request('GET', Uri.parse('${Api.onBoardingScreen}'));


    http.StreamedResponse response = await request.send();
    String res = (await response.stream.bytesToString());
    final onboardingScreensD = onboardingScreensModelFromJson(res);
    if (response.statusCode == 200) {
      if(onboardingScreensD.error == false){
        onBoardingScreensData = onboardingScreensD.onboardingScreens ;
      }
    }
    else {
      print(response.reasonPhrase);
    }
    return [] ;
  }



  Row dotsStatic() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          OnBoardingSelectedPage(selected: _selectedPage == 0),
          OnBoardingSelectedPage(selected: _selectedPage == 1),
          OnBoardingSelectedPage(selected: _selectedPage == 2),
        ]);
  }

  Row dotsApi() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children:
    List.generate(onBoardingScreensData?.length.toInt() ?? 0, (index) {
      return OnBoardingSelectedPage(selected: _selectedPage == index);
    }));
  }

  List<Widget> staticData(BuildContext context) {
    return [
            OnBoardingParts(
              title: UiUtils.getTranslatedLabel(context, welcomeKey),

              subtitle:
              UiUtils.getTranslatedLabel(context, onBoardingSc1Key),
              image: 'logo.png',
            ),
            OnBoardingParts(
              title: UiUtils.getTranslatedLabel(
                  context, topOneTeachersKey),
              subtitle:
              UiUtils.getTranslatedLabel(context, onBoardingSc2Key),
              image: 'pic2.png',
            ),
            OnBoardingParts(
              // title: 'Transaction management',
              title: UiUtils.getTranslatedLabel(context, joinUsKey),
              subtitle:
              UiUtils.getTranslatedLabel(context, onBoardingSc3Key),
              image: '4.png',
            ),
          ];
  }


  // Column oldBuildColumn(BuildContext context) {
  //   return Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           // Container(
  //           //   margin: EdgeInsets.symmetric(horizontal: 30),
  //           //   height: 16,
  //           //   child: Row(
  //           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           //       children: [
  //           //         Visibility(
  //           //             visible: _selectedPage != 0,
  //           //             child: IconButton(
  //           //                 onPressed: () {
  //           //                   setState(() {
  //           //                     _pageController.previousPage(
  //           //                         duration: Duration(seconds: 1),
  //           //                         curve: Curves.easeIn);
  //           //                   });
  //           //                 },
  //           //                 icon: Icon(
  //           //                   Icons.arrow_back_ios,
  //           //                   color: Color(0xFF2D3436),
  //           //                 ))),
  //           //         Visibility(
  //           //             visible: _selectedPage != 2,
  //           //             child: TextButton(
  //           //                 onPressed: () {
  //           //                   setState(() {
  //           //                     _pageController.animateToPage(2,
  //           //                         duration: Duration(seconds: 1),
  //           //                         curve: Curves.easeOut);
  //           //                   });
  //           //                 },
  //           //                 child: Text(
  //           //                   UiUtils.getTranslatedLabel(context, skipKey),
  //           //                   style: TextStyle(
  //           //                       color: primaryColor, fontSize:14),
  //           //                 )))
  //           //       ]),
  //           // ),
  //           Expanded(
  //             child: PageView(
  //               controller: _pageController,
  //               scrollDirection: Axis.horizontal,
  //               onPageChanged: (value) {
  //                 setState(() {
  //                   _selectedPage = value;
  //                 });
  //               },
  //               children: [
  //                  OnBoardingParts(
  //                   title: UiUtils.getTranslatedLabel(context, welcomeKey),
  //
  //                   subtitle:
  //                       UiUtils.getTranslatedLabel(context, onBoardingSc1Key),
  //                   image: 'logo.png',
  //                 ),
  //
  //                 OnBoardingParts(
  //                   title: UiUtils.getTranslatedLabel(
  //                       context, topOneTeachersKey),
  //                   subtitle:
  //                       UiUtils.getTranslatedLabel(context, onBoardingSc2Key),
  //                   image: 'pic2.png',
  //                 ),
  //                 OnBoardingParts(
  //                   // title: 'Transaction management',
  //                   title: UiUtils.getTranslatedLabel(context, joinUsKey),
  //                   subtitle:
  //                       UiUtils.getTranslatedLabel(context, onBoardingSc3Key),
  //                   image: '4.png',
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             height: 20,
  //             child:
  //                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //               OnBoardingSelectedPage(selected: _selectedPage == 0),
  //               OnBoardingSelectedPage(selected: _selectedPage == 1),
  //               OnBoardingSelectedPage(selected: _selectedPage == 2),
  //             ]),
  //           ),
  //           // SizedBox(
  //           //   height: 104,
  //           // ),
  //           // ElevatedButton(onPressed: () {}, child: const Text('Next'))
  //           Padding(
  //             padding: const EdgeInsets.only(top: 20,bottom: 20 ),
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 if (_selectedPage == 2) {
  //                   // Navigator.of(context).pushReplacementNamed(Routes.login);
  //                   Navigator.of(context)
  //                       .push(MaterialPageRoute(builder: (builder) {
  //                     return StepperScreen();
  //                   }));
  //                 } else {
  //                   _pageController.nextPage(
  //                       duration: Duration(seconds: 1), curve: Curves.easeInCubic);
  //                 }
  //               },
  //               child: Text(
  //                 _selectedPage == 2
  //                     ? UiUtils.getTranslatedLabel(context, getStartedKey)
  //                     : UiUtils.getTranslatedLabel(context, nextKey),
  //                 style: TextStyle(color: Colors.white, fontSize: 20 ),
  //               ),
  //               style: ButtonStyle(
  //                   fixedSize: MaterialStateProperty.all(Size(300, 44)),
  //                   backgroundColor: MaterialStateProperty.all(primaryColor),
  //                   shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(12)))),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //         ],
  //       );
  // }
}


