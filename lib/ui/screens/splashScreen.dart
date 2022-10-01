import 'package:eschool_teacher/app/routes.dart';
import 'package:eschool_teacher/cubits/appConfigurationCubit.dart';
import 'package:eschool_teacher/cubits/authCubit.dart';
import 'package:eschool_teacher/ui/screens/onboarding_screen/langScreen.dart';
import 'package:eschool_teacher/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:eschool_teacher/ui/widgets/errorContainer.dart';
import 'package:eschool_teacher/utils/uiUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/onboardingScreensModel.dart';
import '../../data/repositories/settingsRepository.dart';
import '../../utils/api.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchAppConfiguration();
  }

  void fetchAppConfiguration() {
    Future.delayed(Duration.zero, () {
      context.read<AppConfigurationCubit>().fetchAppConfiguration();
    });
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 1));
    if (context.read<AuthCubit>().state is Unauthenticated) {
      // Navigator.of(context).pushReplacementNamed(Routes.login);


      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder) {
        return LangScreen();
      }));
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppConfigurationCubit, AppConfigurationState>(
        listener: (context, state) {
          if (state is AppConfigurationFetchSuccess) {
            navigateToNextScreen();
          }
        },
        builder: (context, state) {
          if (state is AppConfigurationFetchFailure) {
            return Center(
              child: ErrorContainer(
                  onTapRetry: () {
                    fetchAppConfiguration();
                  },
                  errorMessageCode: UiUtils.getErrorMessageFromErrorCode(
                      context, state.errorMessage)),
            );
          }
          return Center(
              child:  Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SvgPicture.asset(UiUtils.getImagePath("appLog.svg")),

                Expanded(child:  Lottie.asset(
                                "assets/animations/lo11.json",
                                animate: true ,width: 160 ,height: 160 ), )

              ],));
               
             
              
              
        },
      ),
    );
  }

}
  // Text(
  //             "Your Best Choice",
  //             style:GoogleFonts.cairo(
  //                 textStyle: TextStyle(color: Colors.black, letterSpacing: .7, fontSize: 15))),