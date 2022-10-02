import 'dart:ui';
import 'package:eschool_teacher/app/routes.dart';
import 'package:eschool_teacher/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:eschool_teacher/getx_controllers/subjects_controller.dart';
import 'package:eschool_teacher/ui/styles/colors.dart';
import 'package:eschool_teacher/ui/widgets/choose_subject.dart';
import 'package:eschool_teacher/utils/labelKeys.dart';
import 'package:eschool_teacher/utils/uiUtils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eschool_teacher/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:eschool_teacher/getx_controllers/image_picker_controller.dart';
import 'package:lottie/lottie.dart';
import '../../../data/models/RegisterTeacherModel.dart';
import '../../../data/models/getTermsConditionModel.dart';
import '../../../data/models/subjectListModel.dart';
import '../../../data/repositories/settingsRepository.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  ImagePickerController _controller = Get.put(ImagePickerController());
  List<SubjectListModel> subjectList = [];
  String agreeTermsConditionsText = "" ;
  XFile? image_file;

  dynamic selectedCity;
  dynamic selectedSubCity;

  RangeValues _currentRangeValues = const RangeValues(3, 10);
  RangeValues _currentRangeValues1 = const RangeValues(3, 10);
  RangeValues _currentRangeValues2 = const RangeValues(3, 10);
  RangeValues _currentRangeValues3 = const RangeValues(3, 10);
  RangeValues _currentRangeValues4 = const RangeValues(3, 10);
  RangeValues _currentRangeValues5 = const RangeValues(3, 10);
  RangeValues _currentRangeValues6 = const RangeValues(3, 10);
  RangeValues _currentRangeValues7 = const RangeValues(3, 10);
  RangeValues _currentRangeValues8 = const RangeValues(3, 10);
  RangeValues _currentRangeValues9 = const RangeValues(3, 10);
  RangeValues _currentRangeValues10 = const RangeValues(3, 10);
  RangeValues _currentRangeValues11 = const RangeValues(3, 10);
  RangeValues _currentRangeValues12 = const RangeValues(3, 10);
  RangeValues _currentRangeValues13 = const RangeValues(3, 10);
  RangeValues _currentRangeValues14 = const RangeValues(3, 10);
  RangeValues _currentRangeValues15 = const RangeValues(3, 10);
  RangeValues _currentRangeValues16 = const RangeValues(3, 10);
  RangeValues _currentRangeValues17 = const RangeValues(3, 10);
  RangeValues _currentRangeValues18 = const RangeValues(3, 10);
  RangeValues _currentRangeValues19 = const RangeValues(3, 10);
  RangeValues _currentRangeValues20 = const RangeValues(3, 10);
  RangeValues _currentRangeValues21 = const RangeValues(3, 10);
  RangeValues _currentRangeValues22 = const RangeValues(3, 10);
  RangeValues _currentRangeValues23 = const RangeValues(3, 10);
  RangeValues _currentRangeValues24 = const RangeValues(3, 10);

  late Future futureMethod;

  RangeValues values = RangeValues(0.9, 1.0);
  String _workThere = 'yes';
  String _work = 'yes';
  String _work1 = 'yes';
  String _work2 = 'yes';
  String _work3 = 'yes';
  String _work4 = 'yes';
  String _work5 = 'yes';
  String _work6 = 'yes';
  String _work7 = 'yes';
  String _work8 = 'yes';
  String _work9 = 'yes';
  String _work10 = 'yes';
  String _work11 = 'yes';
  String _work12 = 'yes';
  String _work13 = 'yes';
  String _work14 = 'yes';
  String _work15 = 'yes';
  String _work16 = 'yes';
  String _work17 = 'yes';
  String _work18 = 'yes';
  String _work19 = 'yes';
  String _work20 = 'yes';
  String _work21 = 'yes';
  String _work22 = 'yes';
  String _work23 = 'yes';
  String _work24 = 'yes';


  bool accept = false;
  bool checked = false;
  bool desapila = false;

  bool subject = false;
  bool subject1 = false;
  bool subject2 = false;
  bool subject3 = false;
  bool subject4 = false;
  bool subject5 = false;
  bool subject6 = false;
  bool subject7 = false;
  bool subject8 = false;
  bool subject9 = false;
  bool subject10 = false;
  bool subject11 = false;
  bool subject12 = false;
  bool subject13 = false;
  bool subject14 = false;
  bool subject15 = false;
  bool subject16 = false;
  bool subject17 = false;
  bool subject18 = false;
  bool subject19 = false;
  bool subject20 = false;
  bool subject21 = false;
  bool subject22 = false;
  bool subject23 = false;
  bool subject24 = false;

  // bool arabic = false;
  // bool math = false;
  // bool sciences = false;
  // bool history = false;
  // bool geography = false;
  // bool scientific_culture = false;
  // bool physic = false;
  // bool chemistry = false;
  // bool biology = false;
  // bool english = false;
  // bool islamic = false;
  // bool technology = false;

  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _idNationalTextController;

  late TextEditingController _emergencyNameTextController;
  late TextEditingController _emergencyNumberTextController;
  late TextEditingController _addressTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _previousWorkTextController;
  late TextEditingController _previousWorkPlaceTextController;
  late TextEditingController _previousWorkNumberTextController;
  late TextEditingController _leavingWorkTextController;

  late TextEditingController _skillsTextController;
  late TextEditingController _experienceWorkTextController;

  DateTime date = DateTime.now();
  bool isDateChoosen = false;

  String _gender = 'M';

  String dropdownCities = 'Jerusalem';
  String dropdownCitiesAr = 'رام الله';
  String dropdownPhone = '+970';

  var phones = [
    '+970',
    '+972',
  ];

  var cities = [
    'Ramallah',
    'Nablus',
    'Jerusalem',
    'Jenin',
    'Jericho',
  ];
  var citiesAr = [
    'رام الله',
    'نابلس',
    'القدس',
    'جنين',
    'أريحا',
  ];
  String dropdownRamallahSubCitiesAr = 'الجانية';
  String dropdownRamallahSubCities = 'a';

  var RamallahSubCitiesAr = [
    'الجانية',
    'الطيبة',
    'الطيرة',
    'المدية',
    'المزرعة',
  ];
  var RamallahSubCities = [
    'a',
    'b',
    'c',
    'd',
    'e',
  ];

  int _activeCurrentStep = 0;

  @override
  void initState() {
    // getData();
    futureMethod = getData();



    super.initState();
    _skillsTextController = TextEditingController();
    _firstNameTextController = TextEditingController();
    _lastNameTextController = TextEditingController();
    _idNationalTextController = TextEditingController();
    _emergencyNameTextController = TextEditingController();
    _emergencyNumberTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _addressTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _previousWorkTextController = TextEditingController();
    _previousWorkPlaceTextController = TextEditingController();
    _previousWorkNumberTextController = TextEditingController();
    _leavingWorkTextController = TextEditingController();
    _experienceWorkTextController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _emergencyNameTextController.dispose();
    _emergencyNumberTextController.dispose();
    _phoneTextController.dispose();
    _addressTextController.dispose();
    _emailTextController.dispose();
    _previousWorkTextController.dispose();
    _previousWorkPlaceTextController.dispose();
    _previousWorkNumberTextController.dispose();
    _leavingWorkTextController.dispose();
    _idNationalTextController.dispose();
    _experienceWorkTextController.dispose();
    _skillsTextController.dispose();
    super.dispose();
  }

  List<Step> stepList() => [
        /// step one
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Text(
            UiUtils.getTranslatedLabel(context, personalInformationKey),
             style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12)
                                )
          ),
          content: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                          isRequired: true,
                          controller: _firstNameTextController,
                          label: UiUtils.getTranslatedLabel(
                              context, firstNameKey )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextField(
                          isRequired: true,
                          controller: _lastNameTextController,
                          label:
                              UiUtils.getTranslatedLabel(context, lastNameKey, )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: MyTextField(
                      isRequired: true,
                    controller: _emailTextController,
                    label: UiUtils.getTranslatedLabel(context, emailKey),

                    helperText: UiUtils.getTranslatedLabel(
                        context, enterVerifiedAccountKey )

                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                            border: Border.all(
                                color: Color.fromARGB(200, 204, 185, 155), width: 2)),
                        child: Row(
                          children: [
                            DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              dropdownColor: Colors.grey.shade200,
                              underline: Divider(
                                thickness: 0,
                              ),
                              value: dropdownPhone,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: phones.map((String phone) {
                                return DropdownMenuItem(
                                  value: phone,
                                  child: Container(
                                      child: Text(
                                    phone,
                                     style: GoogleFonts.cairo(
                                      textStyle: TextStyle(fontSize: 12)
                                      )
                                  )),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownPhone = newValue!;
                                });
                              },
                            ),
                            const VerticalDivider(
                              thickness: 2,
                              color: Color.fromARGB(200, 204, 185, 155),
                              indent: 10,
                              endIndent: 10,
                            ),
                            Container(
                              child: Expanded(
                                  child: TextField(
                                controller: _phoneTextController,
                                keyboardType: TextInputType.phone,
                                cursorColor: const Color.fromARGB(200, 204, 185, 155),
                                minLines: 1,
                                maxLines: 1,
                                style: GoogleFonts.cairo(
                                      textStyle: TextStyle(fontSize: 12)
                                      ),
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  focusColor: Colors.transparent,
                                  border: InputBorder.none,
                                  hintText: "${UiUtils.getTranslatedLabel(context, phoneNumberKey)} *",
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: (){
                        print("Confirm");
                      },
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                            border: Border.all(
                                color: Colors.black.withOpacity(0.5), width: 2)),
                                // color: Color.fromARGB(200, 204, 185, 155), width: 2)),
                        child: Row(
                          children: [
                            Text(UiUtils.getTranslatedLabel(context, confirmKey))
                            // Text("Confirm")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                height: MediaQuery.of(context).size.height * 0.07,
                  child: MyTextField(
                    isRequired: true,
                    textInputType: TextInputType.number,
                    controller: _idNationalTextController,
                    label:
                        UiUtils.getTranslatedLabel(context, NationalIdNumberKey),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () async {
                      DateTime? newDate = await showDatePickerMaterialCupertino();
                      // DateTime? newDate = await showDatePickerMaterial();
                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                        isDateChoosen = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                          border: Border.all(
                              color: Color.fromARGB(200, 204, 185, 155),
                              width: 2)),
                      child: isDateChoosen
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${date.year}/${date.month}/${date.day}',
                                ),
                                Icon(Icons.calendar_month,
                                    color: Colors.black45),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${UiUtils.getTranslatedLabel(context, enterYourBirthdayKey)} *",
                                ),
                                Icon(Icons.calendar_month,
                                    color: Colors.black45),
                              ],
                            ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      border: Border.all(
                          color: Color.fromARGB(200, 204, 185, 155), width: 2)),
                  child: DropdownButton(
                    hint: Text(
                      "${UiUtils.getTranslatedLabel(context, chooseCityKey)} *",
                    ),
                    underline: Divider(
                      thickness: 0,
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                    value: selectedCity,
                    items: cities
                        .map((e) => DropdownMenuItem(
                              child: Text("${e}"),
                              value: e,
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ///chooseVillageKey
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.065,
                //   padding: EdgeInsets.all(5),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.grey.shade200,
                //       border: Border.all(
                //           color: Color.fromARGB(200, 204, 185, 155), width: 2)),
                //   child: DropdownButton(
                //     hint: Text(
                //       UiUtils.getTranslatedLabel(context, chooseVillageKey),
                //     ),
                //     underline: Divider(
                //       thickness: 0,
                //     ),
                //     isExpanded: true,
                //     onChanged: (value) {
                //       setState(() {
                //         selectedSubCity = value;
                //       });
                //     },
                //     value: selectedSubCity,
                //     items: RamallahSubCitiesAr.map((e) => DropdownMenuItem(
                //           child: Text("${e}"),
                //           value: e,
                //         )).toList(),
                //   ),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: MyTextField(
                      isRequired: false,
                      controller: _addressTextController,
                      label: UiUtils.getTranslatedLabel(context, villageKey),
                      helperText: UiUtils.getTranslatedLabel(
                          context, enterVillageNotExistsKey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: Color.fromARGB(200, 204, 185, 155),
                        title: Text(
                          UiUtils.getTranslatedLabel(context, maleKey),
                         style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12)
                                )
                        ),
                        value: 'M',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _gender = value);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: Color.fromARGB(200, 204, 185, 155),
                        title: Text(
                            UiUtils.getTranslatedLabel(context, femaleKey),
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12)
                                )),
                        value: 'F',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _gender = value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: Colors.red,
                      height: 50,
                    )
                  ],
                ),
                Divider(thickness: 1),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: MyTextField(
                    isRequired: false,
                    controller: _emergencyNameTextController,
                    label: UiUtils.getTranslatedLabel(context, emergencyNameKey),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                UiUtils.getTranslatedLabel(
                                    context, emergencyNameKey),
                              ),
                              content: Text(
                                UiUtils.getTranslatedLabel(
                                    context, enterNameEmergencyKey),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context,
                                      UiUtils.getTranslatedLabel(context, okKey)),
                                  child: Text(
                                      UiUtils.getTranslatedLabel(context, okKey)),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.info,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: MyTextField(
                    isRequired: false,
                    controller: _emergencyNumberTextController,
                    label:
                        UiUtils.getTranslatedLabel(context, emergencyNumberKey),
                    textInputType: TextInputType.number,
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(UiUtils.getTranslatedLabel(
                                  context, emergencyNumberKey)),
                              content: Text(UiUtils.getTranslatedLabel(
                                  context, enterNumberEmergencyKey)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context,
                                      UiUtils.getTranslatedLabel(context, okKey)),
                                  child: Text(
                                      UiUtils.getTranslatedLabel(context, okKey)),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.info,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        /// step two
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: Text(
                UiUtils.getTranslatedLabel(context, chooseSubjectsClassesKey)),
            content: staticTopic()

        ),

        Step(
            state: _activeCurrentStep <= 2
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: Text(
              UiUtils.getTranslatedLabel(context, skillsAndExperienceKey),
            ),
            content: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                MyTextFieldMultiline(
                  isRequired: true,
                  controller: _skillsTextController,
                  label: UiUtils.getTranslatedLabel(
                      context, talkAboutYourSkillsKey),
                  // minLine: 5,
                  // maxLine: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextFieldMultiline(
                  isRequired: true,
                  controller: _experienceWorkTextController,
                  label: UiUtils.getTranslatedLabel(
                      context, talkAboutYourExperienceKey),
                ),
              ],
            )),
        Step(
            state: _activeCurrentStep <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 3,
            title: Text(
              UiUtils.getTranslatedLabel(context, previousWorkKey),
            ),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextField(
                      isRequired: false,
                      controller: _previousWorkTextController,
                      label:
                          UiUtils.getTranslatedLabel(context, previousWorkKey)),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                      isRequired: false,
                      controller: _previousWorkPlaceTextController,
                      label: UiUtils.getTranslatedLabel(
                          context, previousWorkPlaceKey)),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                      isRequired: false,
                      textInputType: TextInputType.number,
                      controller: _previousWorkNumberTextController,
                      label: UiUtils.getTranslatedLabel(
                          context, previousWorkNumberKey)),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    UiUtils.getTranslatedLabel(context, doYouWorkThereNowKey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          activeColor: Color.fromARGB(200, 204, 185, 155),
                          title: Text(
                            UiUtils.getTranslatedLabel(context, yesKey),
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12)
                                ),
                          ),
                          value: 'yes',
                          groupValue: _workThere,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _workThere = value);
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: Color.fromARGB(200, 204, 185, 155),
                          title: Text(
                              UiUtils.getTranslatedLabel(context, noKey),
                             style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12)
                                )),
                          value: 'no',
                          groupValue: _workThere,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _workThere = value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.red,
                        height: 50,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _workThere == 'no'
                      ? MyTextField(
                          isRequired: false,
                          controller: _leavingWorkTextController,
                          label: UiUtils.getTranslatedLabel(
                              context, reasonForLeavingPreviousJopKey),
                          minLine: 1,
                          maxLine: 5)
                      : Text(''),
                ],
              ),
            )),
        Step(
            state: _activeCurrentStep <= 4
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 4,
            title: Text(
              UiUtils.getTranslatedLabel(context, uploadImagesKey),
            ),
            content: Column(
              children: [
                Text(
                    UiUtils.getTranslatedLabel(context, imageNoteKey) ,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  child: GetBuilder<ImagePickerController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: _controller.profileImage != null
                            ? InkWell(
                                onTap: () {
                                  _controller.getImageFromGallaryId();
                                },
                                child: Image.file(_controller.profileImage!))
                            : Column(
                                children: [
                                  Text(
                                    UiUtils.getTranslatedLabel(
                                        context, uploadYourProfilePicKey),
                                  style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 14)
                                ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _controller.getImageFromGallaryId();
                                    },
                                    child: Container(
                                        width: Get.width,
                                        height: 100,
                                        child: Icon(Icons.upload_outlined)),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
                Divider(),
                Container(
                  child: GetBuilder<ImagePickerController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: _controller.IdImage != null
                            ? InkWell(
                            onTap: () {
                              _controller.getImageFromGallaryYours();
                            },
                            child: Image.file(_controller.IdImage!))
                            : Column(
                          children: [
                            Text(
                              UiUtils.getTranslatedLabel(
                                  context, uploadYourIdImageKey),
                              style: GoogleFonts.cairo(
                                  textStyle: TextStyle(fontSize: 14)
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _controller.getImageFromGallaryYours();
                              },
                              child: Container(
                                  width: Get.width,
                                  height: 100,
                                  child: Icon(Icons.upload_outlined)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Divider(),
                Container(
                  child: GetBuilder<ImagePickerController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: _controller.certificateImage != null
                            ? InkWell(
                                onTap: () {
                                  _controller.getImageFromGallaryYours();
                                },
                                child: Image.file(_controller.certificateImage!))
                            : Column(
                                children: [
                                  Text(
                                    UiUtils.getTranslatedLabel(
                                        context, uploadYourCertificateImageKey),
                                   style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 14)
                                ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _controller.getImageFromGallaryCertificate();
                                    },
                                    child: Container(
                                        width: Get.width,
                                        height: 100,
                                        child: Icon(Icons.upload_outlined)),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
                Divider(),
                Container(
                  child: GetBuilder<ImagePickerController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: _controller.unCrimeImage != null
                            ? InkWell(
                                onTap: () {
                                  _controller.getImageFromGallary();
                                },
                                child: Image.file(_controller.unCrimeImage!))
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        UiUtils.getTranslatedLabel(context,
                                            lackOfPrecedenceOfCrimesKey),
                                        style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 14)
                                ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: Text(
                                                    UiUtils.getTranslatedLabel(
                                                        context,
                                                        lackOfPrecedenceOfCrimesKey)),
                                                content: Text(
                                                    UiUtils.getTranslatedLabel(
                                                        context,
                                                        documentingLackOfPrecedenceOfCrimesKey)),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context,
                                                        UiUtils
                                                            .getTranslatedLabel(
                                                                context,
                                                                okKey)),
                                                    child: Text(UiUtils
                                                        .getTranslatedLabel(
                                                            context, okKey)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.info,
                                            color: Colors.grey,
                                          )),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _controller.getImageFromGallary();
                                    },
                                    child: Container(
                                        width: Get.width,
                                        height: 100,
                                        child: Icon(Icons.upload_outlined)),
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              ],
            )),
        Step(
          state: StepState.complete,
          isActive: _activeCurrentStep >= 5,
          title: Text(
            UiUtils.getTranslatedLabel(context, confirmKey),
          ),
          content: Column(
            children: [
              Text(
                UiUtils.getTranslatedLabel(context, termsAndConditionsKey),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              if(agreeTermsConditionsText !=  null)
              Html(
                data: agreeTermsConditionsText,
              ),
              // Text(
              //   '1) An Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws..',
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Text(
              //   '2) A Termination clause will inform users that any accounts on your website and mobile app, or users access to your website and app, can be terminated in case of abuses or at your sole discretion. Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.',
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Text(
              //   '3)  Governing Law clause will inform users which laws govern the agreement. These laws should come from the country in which your company is headquartered or the country from which you operate your website and mobile app Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.',
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: primaryColor,
                    value: accept,
                    onChanged: (bool? value) {
                      setState(() {
                        accept = value!;
                      });
                    },
                  ),
                  Text(
                    UiUtils.getTranslatedLabel(context, agreeTermsConditions),style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ];

  Future<DateTime?> showDatePickerMaterial() {
    return showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2023),
                      builder: (context, child) {
                        return Theme(
                            data: Theme.of(context).copyWith(
                                textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                  primary: Colors.black,
                                )),
                                colorScheme: ColorScheme.light(
                                    primary:
                                        Color.fromARGB(200, 204, 185, 155),
                                    onPrimary: Colors.black)),
                            child: child!);
                      },
                    );
  }

  Future<DateTime?> showDatePickerMaterialCupertino() {
    return   showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  )),
              colorScheme: ColorScheme.light(
                  primary:
                  Color.fromARGB(200, 204, 185, 155),
                  onPrimary: Colors.black)),
          child: Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (val) {
                  setState(() {
                    date = val;
                    isDateChoosen = true;
                  });

                  // setState(() {
                  //   date = val;
                  // });
                }),
          ), // This will change to light theme.
        );
      },
    );
  }

  iosDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                // chosenDateTime = value;
                // print(chosenDateTime);
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 3000,
            ),
          );
        });
  }

  Column staticTopic() {
    return Column(
            children: [
              /// subject-1
              if(subjectList.length > 0)
              ChooseSubjectAllData(
                  translatedKey: subjectList[0].name!,
                  translatedKeyAr: subjectList[0].nameAr!,
                  subjectValue: subject,
                  rangeValues: _currentRangeValues,
                  callBack: (bool value){
                    setState(() {
                      subject = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work = value;
                    });
                  },
                  work: _work),
              /// subject-12
              if(subjectList.length > 1)
              ChooseSubjectAllData(
                  translatedKey: subjectList[1].name!,
                  translatedKeyAr: subjectList[1].nameAr!,
                  subjectValue: subject1,
                  rangeValues: _currentRangeValues1,
                  callBack: (bool value){
                    setState(() {
                      subject1 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues1 = values;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work1 = value;
                    });
                  },
                  work: _work1),
              /// subject-2
              if(subjectList.length > 2)
              ChooseSubjectAllData(
                  translatedKey: subjectList[2].name!,
                  translatedKeyAr: subjectList[2].nameAr!,
                  subjectValue: subject2,
                  callBack: (bool value){
                    setState(() {
                      subject2 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues2 = values;
                    });
                  },
                  rangeValues: _currentRangeValues2,
                  callBackWork: (String value){
                    setState(() {
                      _work2 = value;
                    });
                  },
                  work: _work2),
              /// subject-3
              if(subjectList.length > 3)
              ChooseSubjectAllData(
                  translatedKey: subjectList[3].name!,
                  translatedKeyAr: subjectList[3].nameAr!,
                  subjectValue: subject3,
                  callBack: (bool value){
                    setState(() {
                      subject3 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues3 = values;
                    });
                  },
                  rangeValues: _currentRangeValues3,
                  callBackWork: (String value){
                    setState(() {
                      _work3 = value;
                    });
                  },
                  work: _work3),
              /// subject-4
              if(subjectList.length > 4)
              ChooseSubjectAllData(
                  translatedKey: subjectList[4].name!,
                  translatedKeyAr: subjectList[4].nameAr!,
                  subjectValue: subject4,
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues4 = values;
                    });
                  },
                  callBack: (bool value){
                    setState(() {
                      subject4 = value;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work4 = value;
                    });
                  },
                  rangeValues: _currentRangeValues4,
                  work: _work4),
              /// subject-5
              if(subjectList.length > 5)
              ChooseSubjectAllData(
                  translatedKey: subjectList[5].name!,
                  translatedKeyAr: subjectList[5].nameAr!,
                  subjectValue: subject5,
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues5 = values;
                    });
                  },
                  callBack: (bool value){
                    setState(() {
                      subject5 = value;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work5 = value;
                    });
                  },
                  rangeValues: _currentRangeValues5,
                  work: _work5),
              /// subject-6
              if(subjectList.length > 6)
              ChooseSubjectAllData(
                  translatedKey: subjectList[6].name!,
                  translatedKeyAr: subjectList[6].nameAr!,
                  subjectValue: subject6,
                  callBack: (bool value){
                    setState(() {
                      subject6 = value;
                    });
                  },
                  rangeValues: _currentRangeValues6,
                  callBackWork: (String value){
                    setState(() {
                      _work6 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues6 = values;
                    });
                  },
                  work: _work6),
              /// subject-7
              if(subjectList.length > 7)
              ChooseSubjectAllData(
                  translatedKey: subjectList[7].name!,
                  translatedKeyAr: subjectList[7].nameAr!,
                  subjectValue: subject7,
                  callBack: (bool value){
                    setState(() {
                      subject7 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues7 = values;
                    });
                  },
                  rangeValues: _currentRangeValues7,
                  callBackWork: (String value){
                    setState(() {
                      _work7 = value;
                    });
                  },
                  work: _work7),
              /// subject-8
              if(subjectList.length > 8)
              ChooseSubjectAllData(
                  translatedKey: subjectList[8].name!,
                  translatedKeyAr: subjectList[8].nameAr!,
                  subjectValue: subject8,
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues8 = values;
                    });
                  },
                  callBack: (bool value){
                    setState(() {
                      subject8 = value;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work8 = value;
                    });
                  },
                  rangeValues: _currentRangeValues8,
                  work: _work8),
              /// subject-9
              if(subjectList.length > 9)
              ChooseSubjectAllData(
                  translatedKey: subjectList[9].name!,
                  translatedKeyAr: subjectList[9].nameAr!,
                  subjectValue: subject9,
                  callBack: (bool value){
                    setState(() {
                      subject9 = value;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work9 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues9 = values;
                    });
                  },
                  rangeValues: _currentRangeValues9,
                  work: _work9),
              /// subject-10
              if(subjectList.length > 10)
              ChooseSubjectAllData(
                  translatedKey: subjectList[10].name!,
                  translatedKeyAr: subjectList[10].nameAr!,
                  subjectValue: subject10,
                  callBack: (bool value){
                    setState(() {
                      subject10 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues10 = values;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work10 = value;
                    });
                  },
                  rangeValues: _currentRangeValues10,
                  work: _work10),
              /// subject-11
              if(subjectList.length > 11)
              ChooseSubjectAllData(
                  translatedKey: subjectList[11].name!,
                  translatedKeyAr: subjectList[11].nameAr!,
                  subjectValue: subject11,
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues11 = values;
                    });
                  },
                  callBackWork: (String value){
                    setState(() {
                      _work11 = value;
                    });
                  },
                  callBack: (bool value){
                    setState(() {
                      subject11 = value;
                    });
                  },
                  rangeValues: _currentRangeValues11,
                  work: _work11),


              /// subject-12
              if(subjectList.length > 12)
                ChooseSubjectAllData(
                    translatedKey: subjectList[12].name!,
                    translatedKeyAr: subjectList[12].nameAr!,
                    subjectValue: subject12,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues12 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work12 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject12 = value;
                      });
                    },
                    rangeValues: _currentRangeValues12,
                    work: _work12),

              /// subject-13
              if(subjectList.length > 13)
                ChooseSubjectAllData(
                    translatedKey: subjectList[13].name!,
                    translatedKeyAr: subjectList[13].nameAr!,
                    subjectValue: subject13,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues13 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work13 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject13 = value;
                      });
                    },
                    rangeValues: _currentRangeValues13,
                    work: _work13),


              /// subject-14
              if(subjectList.length > 14)
                ChooseSubjectAllData(
                    translatedKey: subjectList[14].name!,
                    translatedKeyAr: subjectList[14].nameAr!,
                    subjectValue: subject14,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues14 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work14 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject14 = value;
                      });
                    },
                    rangeValues: _currentRangeValues14,
                    work: _work14),

              /// subject-15
              if(subjectList.length > 15)
                ChooseSubjectAllData(
                    translatedKey: subjectList[15].name!,
                    translatedKeyAr: subjectList[15].nameAr!,
                    subjectValue: subject15,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues15 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work15 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject15 = value;
                      });
                    },
                    rangeValues: _currentRangeValues15,
                    work: _work15),

              /// subject-16
              if(subjectList.length > 16)
                ChooseSubjectAllData(
                    translatedKey: subjectList[16].name!,
                    translatedKeyAr: subjectList[16].nameAr!,
                    subjectValue: subject16,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues16 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work16 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject16 = value;
                      });
                    },
                    rangeValues: _currentRangeValues16,
                    work: _work16),

              /// subject-17
              if(subjectList.length > 17)
                ChooseSubjectAllData(
                    translatedKey: subjectList[17].name!,
                    translatedKeyAr: subjectList[17].nameAr!,
                    subjectValue: subject17,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues17 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work17 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject17 = value;
                      });
                    },
                    rangeValues: _currentRangeValues17,
                    work: _work17),

              /// subject-18
              if(subjectList.length > 18)
                ChooseSubjectAllData(
                    translatedKey: subjectList[18].name!,
                    translatedKeyAr: subjectList[18].nameAr!,
                    subjectValue: subject18,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues18 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work18 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject18 = value;
                      });
                    },
                    rangeValues: _currentRangeValues18,
                    work: _work18),

              /// subject-19
              if(subjectList.length > 19)
                ChooseSubjectAllData(
                    translatedKey: subjectList[19].name!,
                    translatedKeyAr: subjectList[19].nameAr!,
                    subjectValue: subject19,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues19 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work19 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject19 = value;
                      });
                    },
                    rangeValues: _currentRangeValues19,
                    work: _work19),

              /// subject-20
              if(subjectList.length > 20)
                ChooseSubjectAllData(
                    translatedKey: subjectList[20].name!,
                    translatedKeyAr: subjectList[20].nameAr!,
                    subjectValue: subject20,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues20 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work20 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject20 = value;
                      });
                    },
                    rangeValues: _currentRangeValues20,
                    work: _work20),

              /// subject-21
              if(subjectList.length > 21)
                ChooseSubjectAllData(
                    translatedKey: subjectList[21].name!,
                    translatedKeyAr: subjectList[21].nameAr!,
                    subjectValue: subject21,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues21 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work21 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject21 = value;
                      });
                    },
                    rangeValues: _currentRangeValues21,
                    work: _work21),

              /// subject-22
              if(subjectList.length > 22)
                ChooseSubjectAllData(
                    translatedKey: subjectList[22].name!,
                    translatedKeyAr: subjectList[22].nameAr!,
                    subjectValue: subject22,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues22 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work22 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject22 = value;
                      });
                    },
                    rangeValues: _currentRangeValues22,
                    work: _work22),

              /// subject-23
              if(subjectList.length > 23)
                ChooseSubjectAllData(
                    translatedKey: subjectList[23].name!,
                    translatedKeyAr: subjectList[23].nameAr!,
                    subjectValue: subject23,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues23 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work23 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject23 = value;
                      });
                    },
                    rangeValues: _currentRangeValues23,
                    work: _work23),

              /// subject-24
              if(subjectList.length > 24)
                ChooseSubjectAllData(
                    translatedKey: subjectList[24].name!,
                    translatedKeyAr: subjectList[24].nameAr!,
                    subjectValue: subject24,
                    callBackRange: (RangeValues values){
                      setState(() {
                        _currentRangeValues24 = values;
                      });
                    },
                    callBackWork: (String value){
                      setState(() {
                        _work24 = value;
                      });
                    },
                    callBack: (bool value){
                      setState(() {
                        subject24 = value;
                      });
                    },
                    rangeValues: _currentRangeValues24,
                    work: _work24),

              
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 204, 185, 155),
        title: Text(
          UiUtils.getTranslatedLabel(context, teacherInformationKey),
          style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold)
                                )
        ),
      ),
      body: futureBody(),
    );
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
              return Center(
                  child: Lottie.asset(
                      "assets/animations/lo11.json",
                      animate: true ,width: 160 ,height: 160 ));

            case ConnectionState.done:

              return Stepper(
                  physics: AlwaysScrollableScrollPhysics(),
                  type: StepperType.vertical,
                  currentStep: _activeCurrentStep,
                  steps: stepList(),
                  onStepContinue: () {
                    if (_activeCurrentStep != 5) {
                      if (_activeCurrentStep < (stepList().length - 1)) {
                        setState(() {
                          _activeCurrentStep += 1;
                        });
                      }
                    }
                    else {
                      if (accept) {
                        _performRegister();
                        setState(() {});
                      } else {
                        final snackBar = SnackBar(
                          dismissDirection: DismissDirection.horizontal,
                          backgroundColor: Colors.red,
                          content: Text(
                            UiUtils.getTranslatedLabel(context, agreeTermsConditions),style: TextStyle(fontSize: 12),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        setState(() {
                          desapila = true;
                        });
                      }
                    }
                  },
                  onStepCancel: () {
                    if (_activeCurrentStep == 0) {
                      return;
                    }

                    setState(() {
                      _activeCurrentStep -= 1;
                    });
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _activeCurrentStep = index;
                    });
                  },
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


  // List<int> subject_ids = [] ;
  // List<int> grades_from = [] ;
  // List<int> grades_to = [] ;
  // List<int> main_subjects = [] ;
  List<TopicAPI> topicsAPI = [] ;



  Future<void> _performRegister() async {
    // print("first_name ${_firstNameTextController.text}");
    // print("last_name ${_lastNameTextController.text}");
    // print("email ${_emailTextController.text}");
    // print("gender ${_gender}");
    // print("intro ${dropdownPhone}");
    // print("phone ${_phoneTextController.text}");
    // print("birth_day ${date.year}-${date.month}-${date.day}");
    // print("national_id_number  ${_idNationalTextController.text}");
    // print("national_id_photo  ${_idNationalTextController.text}");
    // print("bio  ${_skillsTextController.text}");
    // print("experience  ${_experienceWorkTextController.text}");
    // print("country  ${dropdownCities}");
    // print("village  ${_addressTextController.text}");
    // print("e_contact_name  ${_emergencyNameTextController.text}");
    // print("e_contact_number  ${_emergencyNumberTextController.text}");
    // print("previous_work  ${_previousWorkTextController.text}");
    // print("previous_work_number  ${_previousWorkNumberTextController.text}");
    // print("p_work_place  ${_previousWorkPlaceTextController.text}");
    // print("r_leaving_prev_job  ${_leavingWorkTextController.text}");
    // print("work_there  ${_work == 'no' ? 0 : 1}");
    ///
    // print("subject_ids[0]  ${subject_ids[0]}");
    // print("grades_from[0]  ${grades_from[0]}");
    // print("grades_to[0]  ${grades_to[0]}");
    // print("main_subjects[0]  ${main_subjects[0]}");


    // bool sciences = false;
    // bool history = false;
    // bool geography = false;
    // bool scientific_culture = false;
    // bool physic = false;
    // bool chemistry = false;
    // bool biology = false;
    // bool english = false;
    // bool islamic = false;
    // bool technology = false;


    topicsAPI = [] ;
     // subject_ids = [] ;
     // grades_from = [] ;
     // grades_to = [] ;
     // main_subjects = [] ;


    /// subject-1
    if(subjectList.length > 0)
    addTopic(
      topic: subject,
      subjectId: subjectList[0].id!,
      from: _currentRangeValues.start.toInt(),
      to: _currentRangeValues.end.toInt(),
      work: _work,
    );

    /// subject-12
    if(subjectList.length > 1)
    addTopic(
      topic: subject1,
      subjectId: subjectList[1].id!,
      from: _currentRangeValues1.start.toInt(),
      to: _currentRangeValues1.end.toInt(),
      work: _work1,
    );

    /// subject-2
    if(subjectList.length > 2)
    addTopic(
      topic: subject2,
      subjectId: subjectList[2].id!,
      from: _currentRangeValues2.start.toInt(),
      to: _currentRangeValues2.end.toInt(),
      work: _work2,
    );

    /// subject-3
    if(subjectList.length > 3)
    addTopic(
      topic: subject3,
      subjectId: subjectList[3].id!,
      from: _currentRangeValues3.start.toInt(),
      to: _currentRangeValues3.end.toInt(),
      work: _work3,
    );
    /// subject-4
    if(subjectList.length > 4)
    addTopic(
      topic: subject4,
      subjectId: subjectList[4].id!,
      from: _currentRangeValues4.start.toInt(),
      to: _currentRangeValues4.end.toInt(),
      work: _work4,
    );

    /// subject-5
    if(subjectList.length > 5)
    addTopic(
      topic: subject5,
      subjectId: subjectList[5].id!,
      from: _currentRangeValues5.start.toInt(),
      to: _currentRangeValues5.end.toInt(),
      work: _work5,
    );

    /// subject-6
    if(subjectList.length > 6)
    addTopic(
      topic: subject6,
      subjectId: subjectList[6].id!,
      from: _currentRangeValues6.start.toInt(),
      to: _currentRangeValues6.end.toInt(),
      work: _work6,
    );

    /// subject-7
    if(subjectList.length > 7)
    addTopic(
      topic: subject7,
      subjectId: subjectList[7].id!,
      from: _currentRangeValues7.start.toInt(),
      to: _currentRangeValues7.end.toInt(),
      work: _work7,
    );

    /// subject-8
    if(subjectList.length > 8)
    addTopic(
      topic: subject8,
      subjectId: subjectList[8].id!,
      from: _currentRangeValues8.start.toInt(),
      to: _currentRangeValues8.end.toInt(),
      work: _work8,
    );

    /// subject-9
    if(subjectList.length > 9)
    addTopic(
      topic: subject9,
      subjectId: subjectList[9].id!,
      from: _currentRangeValues9.start.toInt(),
      to: _currentRangeValues9.end.toInt(),
      work: _work9,
    );

    /// subject-10
    if(subjectList.length > 10)
    addTopic(
      topic: subject10,
      subjectId: subjectList[10].id!,
      from: _currentRangeValues10.start.toInt(),
      to: _currentRangeValues10.end.toInt(),
      work: _work10,
    );

    /// subject-11
    if(subjectList.length > 11)
    addTopic(
      topic: subject11,
      subjectId: subjectList[11].id!,
      from: _currentRangeValues11.start.toInt(),
      to: _currentRangeValues11.end.toInt(),
      work: _work11,
    );
    /// subject-12
    if(subjectList.length > 12)
    addTopic(
      topic: subject12,
      subjectId: subjectList[12].id!,
      from: _currentRangeValues12.start.toInt(),
      to: _currentRangeValues12.end.toInt(),
      work: _work12,
    );
    /// subject-13
    if(subjectList.length > 13)
    addTopic(
      topic: subject13,
      subjectId: subjectList[13].id!,
      from: _currentRangeValues13.start.toInt(),
      to: _currentRangeValues13.end.toInt(),
      work: _work13,
    );
    /// subject-14
    if(subjectList.length > 14)
      addTopic(
        topic: subject14,
        subjectId: subjectList[14].id!,
        from: _currentRangeValues14.start.toInt(),
        to: _currentRangeValues14.end.toInt(),
        work: _work14,
      );
    /// subject-15
    if(subjectList.length > 15)
      addTopic(
        topic: subject15,
        subjectId: subjectList[15].id!,
        from: _currentRangeValues15.start.toInt(),
        to: _currentRangeValues15.end.toInt(),
        work: _work15,
      ); 
    /// subject-16
    if(subjectList.length > 16)
      addTopic(
        topic: subject16,
        subjectId: subjectList[16].id!,
        from: _currentRangeValues16.start.toInt(),
        to: _currentRangeValues16.end.toInt(),
        work: _work16,
      );  
    /// subject-17
    if(subjectList.length > 17)
      addTopic(
        topic: subject17,
        subjectId: subjectList[17].id!,
        from: _currentRangeValues17.start.toInt(),
        to: _currentRangeValues17.end.toInt(),
        work: _work17,
      );  
    /// subject-18
    if(subjectList.length > 18)
      addTopic(
        topic: subject18,
        subjectId: subjectList[18].id!,
        from: _currentRangeValues18.start.toInt(),
        to: _currentRangeValues18.end.toInt(),
        work: _work18,
      );
    /// subject-19
    if(subjectList.length > 19)
      addTopic(
        topic: subject19,
        subjectId: subjectList[19].id!,
        from: _currentRangeValues19.start.toInt(),
        to: _currentRangeValues19.end.toInt(),
        work: _work19,
      );
    /// subject-20
    if(subjectList.length > 20)
      addTopic(
        topic: subject20,
        subjectId: subjectList[20].id!,
        from: _currentRangeValues20.start.toInt(),
        to: _currentRangeValues20.end.toInt(),
        work: _work20,
      );
    /// subject-21
    if(subjectList.length > 21)
      addTopic(
        topic: subject21,
        subjectId: subjectList[21].id!,
        from: _currentRangeValues21.start.toInt(),
        to: _currentRangeValues21.end.toInt(),
        work: _work21,
      );
    /// subject-22
    if(subjectList.length > 22)
      addTopic(
        topic: subject22,
        subjectId: subjectList[22].id!,
        from: _currentRangeValues22.start.toInt(),
        to: _currentRangeValues22.end.toInt(),
        work: _work22,
      );
    /// subject-23
    if(subjectList.length > 23)
      addTopic(
        topic: subject23,
        subjectId: subjectList[23].id!,
        from: _currentRangeValues23.start.toInt(),
        to: _currentRangeValues23.end.toInt(),
        work: _work23,
      );
    /// subject-24
    if(subjectList.length > 24)
      addTopic(
        topic: subject24,
        subjectId: subjectList[24].id!,
        from: _currentRangeValues24.start.toInt(),
        to: _currentRangeValues24.end.toInt(),
        work: _work24,
      );
    
    
    

    topicsAPI.forEach((element) {
      print("subject_ids[${topicsAPI.indexOf(element)}]  ${element.subject_id}");
      print("grades_from[${topicsAPI.indexOf(element)}]  ${element.grades_from}");
      print("grades_to[${topicsAPI.indexOf(element)}]  ${element.grades_to}");
      print("main_subjects[${topicsAPI.indexOf(element)}]  ${element.main_subject}");
      print(' ------------ ');
    });

    callAPI();
  }

  void addTopic({required bool topic,required int from, required int subjectId,required int to, required String work}) {
    if(topic) {
      topicsAPI.forEach((element) {
        if(element.subject_id == subjectId){
          topicsAPI.remove(element);
        }
      });
      topicsAPI.add(TopicAPI(
          subject_id: subjectId,
          grades_from: from,
          grades_to: to,
          main_subject: work == 'no' ? 0 : 1));

      // subject_ids = arabic ;
      // grades_from.add(from);
      // grades_to.add(to);
      // main_subjects.add(work == 'no' ? 0 : 1);

    }
  }

  void callAPI() {
    if(_checkEmail()){
      final snackBar = SnackBar(
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.red,
        content: Text(
          UiUtils.getTranslatedLabel(context, emailWrong),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else{
      if (_checkPersonalData()) {
        if (_images()) {
          // Navigator.of(context).pushReplacementNamed(Routes.login);

          _showLoadingDialog();
          sendAPI();

        } else {
          final snackBarForImages = SnackBar(
            dismissDirection: DismissDirection.horizontal,
            backgroundColor: Colors.red,
            content: Text(
              UiUtils.getTranslatedLabel(context, uploadAllImages),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBarForImages);
        }
      }
      else {
        final snackBar = SnackBar(
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: Colors.red,
          content: Text(
            UiUtils.getTranslatedLabel(context, enterRequiredData),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }


  void sendAPI() async {
    // var request = http.MultipartRequest('POST', Uri.parse('https://controlpaneltaca.teacheraclickaway.com/api/teacher/register'));
    var request = http.MultipartRequest('POST', Uri.parse('${Api.registerTeacher}'));
    request.fields.addAll({
      'first_name': '${_firstNameTextController.text}',
      'last_name': '${_lastNameTextController.text}',
      'email': '${_emailTextController.text}',
      'gender': '${_gender}',
      'intro': '${dropdownPhone}',
      'phone': '${_phoneTextController.text}',
      'birth_day': '${date.year}-${date.month}-${date.day}',
      'national_id_number': '${_idNationalTextController.text}',
      'skills': '${_skillsTextController.text}',
      'experience': '${_experienceWorkTextController.text}',
      'country': '${selectedCity}',
      if(_addressTextController.text.isNotEmpty)'village': '${_addressTextController.text}',
        if(_emergencyNameTextController.text.isNotEmpty)  'e_contact_name': '${_emergencyNameTextController.text}',
      if(_emergencyNumberTextController.text.isNotEmpty)  'e_contact_number': '${_emergencyNumberTextController.text}',
      if(_previousWorkTextController.text.isNotEmpty)   'previous_work': '${_previousWorkTextController.text}',
      if(_previousWorkNumberTextController.text.isNotEmpty)  'previous_work_number': '${_previousWorkNumberTextController.text}',
      if(_previousWorkPlaceTextController.text.isNotEmpty)  'p_work_place': '${_previousWorkPlaceTextController.text}',
      // 'r_leaving_prev_job': '${_leavingWorkTextController.text != null && _leavingWorkTextController.text != ''  ? _leavingWorkTextController.text : "-"}',
      if(_workThere == 'no') 'r_leaving_prev_job': '${_leavingWorkTextController.text}',
      'work_there': '${_workThere == 'no' ? 0 : 1}',

       if(topicsAPI.length > 0) 'subject_ids[0]': "${topicsAPI[0].subject_id}",
       if(topicsAPI.length > 0) 'grades_from[0]': "${topicsAPI[0].grades_from}",
       if(topicsAPI.length > 0) 'grades_to[0]': "${topicsAPI[0].grades_to}",
       if(topicsAPI.length > 0) 'main_subjects[0]': "${topicsAPI[0].main_subject}",

      if(topicsAPI.length > 1) 'subject_ids[1]': "${topicsAPI[1].subject_id}",
      if(topicsAPI.length > 1) 'grades_from[1]': "${topicsAPI[1].grades_from}",
      if(topicsAPI.length > 1) 'grades_to[1]': "${topicsAPI[1].grades_to}",
      if(topicsAPI.length > 1) 'main_subjects[1]': "${topicsAPI[1].main_subject}",

      if(topicsAPI.length > 2) 'subject_ids[2]': "${topicsAPI[2].subject_id}",
      if(topicsAPI.length > 2) 'grades_from[2]': "${topicsAPI[2].grades_from}",
      if(topicsAPI.length > 2) 'grades_to[2]': "${topicsAPI[2].grades_to}",
      if(topicsAPI.length > 2) 'main_subjects[2]': "${topicsAPI[2].main_subject}",

      if(topicsAPI.length > 3) 'subject_ids[3]': "${topicsAPI[3].subject_id}",
      if(topicsAPI.length > 3) 'grades_from[3]': "${topicsAPI[3].grades_from}",
      if(topicsAPI.length > 3) 'grades_to[3]': "${topicsAPI[3].grades_to}",
      if(topicsAPI.length > 3) 'main_subjects[3]': "${topicsAPI[3].main_subject}",

      if(topicsAPI.length > 4) 'subject_ids[4]': "${topicsAPI[4].subject_id}",
      if(topicsAPI.length > 4) 'grades_from[4]': "${topicsAPI[4].grades_from}",
      if(topicsAPI.length > 4) 'grades_to[4]': "${topicsAPI[4].grades_to}",
      if(topicsAPI.length > 4) 'main_subjects[4]': "${topicsAPI[4].main_subject}",

      if(topicsAPI.length > 5) 'subject_ids[5]': "${topicsAPI[5].subject_id}",
      if(topicsAPI.length > 5) 'grades_from[5]': "${topicsAPI[5].grades_from}",
      if(topicsAPI.length > 5) 'grades_to[5]': "${topicsAPI[5].grades_to}",
      if(topicsAPI.length > 5) 'main_subjects[5]': "${topicsAPI[5].main_subject}",

      if(topicsAPI.length > 6) 'subject_ids[6]': "${topicsAPI[6].subject_id}",
      if(topicsAPI.length > 6) 'grades_from[6]': "${topicsAPI[6].grades_from}",
      if(topicsAPI.length > 6) 'grades_to[6]': "${topicsAPI[6].grades_to}",
      if(topicsAPI.length > 6) 'main_subjects[6]': "${topicsAPI[6].main_subject}",

      if(topicsAPI.length > 7) 'subject_ids[7]': "${topicsAPI[7].subject_id}",
      if(topicsAPI.length > 7) 'grades_from[7]': "${topicsAPI[7].grades_from}",
      if(topicsAPI.length > 7) 'grades_to[7]': "${topicsAPI[7].grades_to}",
      if(topicsAPI.length > 7) 'main_subjects[7]': "${topicsAPI[7].main_subject}",

      if(topicsAPI.length > 8) 'subject_ids[8]': "${topicsAPI[8].subject_id}",
      if(topicsAPI.length > 8) 'grades_from[8]': "${topicsAPI[8].grades_from}",
      if(topicsAPI.length > 8) 'grades_to[8]': "${topicsAPI[8].grades_to}",
      if(topicsAPI.length > 8) 'main_subjects[8]': "${topicsAPI[8].main_subject}",

      if(topicsAPI.length > 9) 'subject_ids[9]': "${topicsAPI[9].subject_id}",
      if(topicsAPI.length > 9) 'grades_from[9]': "${topicsAPI[9].grades_from}",
      if(topicsAPI.length > 9) 'grades_to[9]': "${topicsAPI[9].grades_to}",
      if(topicsAPI.length > 9) 'main_subjects[9]': "${topicsAPI[9].main_subject}",

      if(topicsAPI.length > 10) 'subject_ids[10]': "${topicsAPI[10].subject_id}",
      if(topicsAPI.length > 10) 'grades_from[10]': "${topicsAPI[10].grades_from}",
      if(topicsAPI.length > 10) 'grades_to[10]': "${topicsAPI[10].grades_to}",
      if(topicsAPI.length > 10) 'main_subjects[10]': "${topicsAPI[10].main_subject}",

      if(topicsAPI.length > 11) 'subject_ids[11]': "${topicsAPI[11].subject_id}",
      if(topicsAPI.length > 11) 'grades_from[11]': "${topicsAPI[11].grades_from}",
      if(topicsAPI.length > 11) 'grades_to[11]': "${topicsAPI[11].grades_to}",
      if(topicsAPI.length > 11) 'main_subjects[11]': "${topicsAPI[11].main_subject}",

      if(topicsAPI.length > 12) 'subject_ids[12]': "${topicsAPI[12].subject_id}",
      if(topicsAPI.length > 12) 'grades_from[12]': "${topicsAPI[12].grades_from}",
      if(topicsAPI.length > 12) 'grades_to[12]': "${topicsAPI[12].grades_to}",
      if(topicsAPI.length > 12) 'main_subjects[12]': "${topicsAPI[12].main_subject}",

      if(topicsAPI.length > 13) 'subject_ids[13]': "${topicsAPI[13].subject_id}",
      if(topicsAPI.length > 13) 'grades_from[13]': "${topicsAPI[13].grades_from}",
      if(topicsAPI.length > 13) 'grades_to[13]': "${topicsAPI[13].grades_to}",
      if(topicsAPI.length > 13) 'main_subjects[13]': "${topicsAPI[13].main_subject}",

      if(topicsAPI.length > 14) 'subject_ids[14]': "${topicsAPI[14].subject_id}",
      if(topicsAPI.length > 14) 'grades_from[14]': "${topicsAPI[14].grades_from}",
      if(topicsAPI.length > 14) 'grades_to[14]': "${topicsAPI[14].grades_to}",
      if(topicsAPI.length > 14) 'main_subjects[14]': "${topicsAPI[14].main_subject}",

      if(topicsAPI.length > 15) 'subject_ids[15]': "${topicsAPI[15].subject_id}",
      if(topicsAPI.length > 15) 'grades_from[15]': "${topicsAPI[15].grades_from}",
      if(topicsAPI.length > 15) 'grades_to[15]': "${topicsAPI[15].grades_to}",
      if(topicsAPI.length > 15) 'main_subjects[15]': "${topicsAPI[15].main_subject}",

      if(topicsAPI.length > 16) 'subject_ids[16]': "${topicsAPI[16].subject_id}",
      if(topicsAPI.length > 16) 'grades_from[16]': "${topicsAPI[16].grades_from}",
      if(topicsAPI.length > 16) 'grades_to[16]': "${topicsAPI[16].grades_to}",
      if(topicsAPI.length > 16) 'main_subjects[16]': "${topicsAPI[16].main_subject}",

      if(topicsAPI.length > 17) 'subject_ids[17]': "${topicsAPI[17].subject_id}",
      if(topicsAPI.length > 17) 'grades_from[17]': "${topicsAPI[17].grades_from}",
      if(topicsAPI.length > 17) 'grades_to[17]': "${topicsAPI[17].grades_to}",
      if(topicsAPI.length > 17) 'main_subjects[17]': "${topicsAPI[17].main_subject}",

      if(topicsAPI.length > 18) 'subject_ids[18]': "${topicsAPI[18].subject_id}",
      if(topicsAPI.length > 18) 'grades_from[18]': "${topicsAPI[18].grades_from}",
      if(topicsAPI.length > 18) 'grades_to[18]': "${topicsAPI[18].grades_to}",
      if(topicsAPI.length > 18) 'main_subjects[18]': "${topicsAPI[18].main_subject}",

      if(topicsAPI.length > 19) 'subject_ids[19]': "${topicsAPI[19].subject_id}",
      if(topicsAPI.length > 19) 'grades_from[19]': "${topicsAPI[19].grades_from}",
      if(topicsAPI.length > 19) 'grades_to[19]': "${topicsAPI[19].grades_to}",
      if(topicsAPI.length > 19) 'main_subjects[19]': "${topicsAPI[19].main_subject}",

      if(topicsAPI.length > 20) 'subject_ids[20]': "${topicsAPI[20].subject_id}",
      if(topicsAPI.length > 20) 'grades_from[20]': "${topicsAPI[20].grades_from}",
      if(topicsAPI.length > 20) 'grades_to[20]': "${topicsAPI[20].grades_to}",
      if(topicsAPI.length > 20) 'main_subjects[20]': "${topicsAPI[20].main_subject}",

      if(topicsAPI.length > 21) 'subject_ids[21]': "${topicsAPI[21].subject_id}",
      if(topicsAPI.length > 21) 'grades_from[21]': "${topicsAPI[21].grades_from}",
      if(topicsAPI.length > 21) 'grades_to[21]': "${topicsAPI[21].grades_to}",
      if(topicsAPI.length > 21) 'main_subjects[21]': "${topicsAPI[21].main_subject}",

      if(topicsAPI.length > 22) 'subject_ids[22]': "${topicsAPI[22].subject_id}",
      if(topicsAPI.length > 22) 'grades_from[22]': "${topicsAPI[22].grades_from}",
      if(topicsAPI.length > 22) 'grades_to[22]': "${topicsAPI[22].grades_to}",
      if(topicsAPI.length > 22) 'main_subjects[22]': "${topicsAPI[22].main_subject}",

      if(topicsAPI.length > 23) 'subject_ids[23]': "${topicsAPI[23].subject_id}",
      if(topicsAPI.length > 23) 'grades_from[23]': "${topicsAPI[23].grades_from}",
      if(topicsAPI.length > 23) 'grades_to[23]': "${topicsAPI[23].grades_to}",
      if(topicsAPI.length > 23) 'main_subjects[23]': "${topicsAPI[23].main_subject}",

      if(topicsAPI.length > 24) 'subject_ids[24]': "${topicsAPI[24].subject_id}",
      if(topicsAPI.length > 24) 'grades_from[24]': "${topicsAPI[24].grades_from}",
      if(topicsAPI.length > 24) 'grades_to[24]': "${topicsAPI[24].grades_to}",
      if(topicsAPI.length > 24) 'main_subjects[24]': "${topicsAPI[24].main_subject}",





      // 'subject_ids[0]': '1',
      // 'grades_from[0]': '5',
      // 'grades_to[0]': '9',
      // 'main_subjects[0]': '1'
    });
    request.files.add(await http.MultipartFile.fromPath('national_id_photo', '${_controller.IdImage?.path}'));
    request.files.add(await http.MultipartFile.fromPath('certificate', '${_controller.certificateImage?.path}'));
    if(_controller.unCrimeImage != null)request.files.add(await http.MultipartFile.fromPath('doc_lack_crimes', '${_controller.unCrimeImage?.path}'));
    request.files.add(await http.MultipartFile.fromPath('profile', '${_controller.profileImage?.path}'));


    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString() ;
    final registerTeacher = registerTeacherFromJson(res);
    if (response.statusCode == 200) {
      print(res);
      if(registerTeacher.error != null && registerTeacher.error == true){
        // EasyLoading.showError("${registerTeacher.message}") ;
        _dissmisLoadingDialog();
        final snackBar = SnackBar(
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: Colors.red,
          content: Text(
            UiUtils.getTranslatedLabel(context, enterRequiredData),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }else {
        // EasyLoading.showSuccess("${registerTeacher.message}") ;
        _dissmisLoadingDialog();

           loginDialog();

        // Navigator.of(context).pushReplacementNamed(Routes.login);
      }
    }
    else {
      _dissmisLoadingDialog();
      print(response.reasonPhrase);
    }
  }
  void loginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          UiUtils.getTranslatedLabel(
              context, successfullyRegistrationTitleKey),
        ),
        content: Text(
          UiUtils.getTranslatedLabel(
              context, successfullyRegistrationKey),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Routes.login);
            },
            child: Text(
                UiUtils.getTranslatedLabel(context, okKey)),
          ),
        ],
      ),
    );
  }

  bool _images() {
    if (_controller.IdImage != null &&
        _controller.profileImage != null &&
        _controller.certificateImage != null
        // && _controller.unCrimeImage != null
    ) {
      return true;
    }

    return false;
  }

  bool _checkPersonalData() {
    if (
        _firstNameTextController.text.isNotEmpty &&
        _lastNameTextController.text.isNotEmpty &&
        _idNationalTextController.text.isNotEmpty &&
        // _emergencyNameTextController.text.isNotEmpty &&
        // _emergencyNumberTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
         // _addressTextController.text.isNotEmpty &&
        // _previousWorkTextController.text.isNotEmpty &&
        // _previousWorkPlaceTextController.text.isNotEmpty &&
        _skillsTextController.text.isNotEmpty &&
        _experienceWorkTextController.text.isNotEmpty &&
        isDateChoosen) {
      return true;
    }
    return false;
  }

  bool _checkEmail() {
    if (!validateEmail(_emailTextController.text)) {
      return true ;
    }
    return false;
  }
  static  validateEmail(email) {
    var re = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return re.hasMatch(email);
  }
  Future getData() async {
    await getSubjects();
    await getTermsCondition();
  }

  Future<void> getSubjects() async {
    var request = http.Request('GET', Uri.parse('${Api.subjectList}'));
    http.StreamedResponse response = await request.send();
      String res = (await response.stream.bytesToString());
    if (response.statusCode == 200) {
      final subjectListModel = subjectListModelFromJson(res);
      if(subjectListModel.isNotEmpty){
        subjectList = subjectListModel ;
        print("subjectList ${subjectList.length}");
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }
/// termsCondition
  Future<void> getTermsCondition() async {
    var headers = {
      'Authorization': 'Bearer {{teacher_token}}'
    };
    bool isArabic = SettingsRepository().getCurrentLanguageCode() == "ar" ;
    var request = http.Request('GET', Uri.parse('${isArabic ? Api.termsConditionAr : Api.termsCondition}')); ///

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String res = (await response.stream.bytesToString());
    final terms = getTermsConditionModelFromJson(res);
    if (response.statusCode == 200) {
      if(terms.error == false){
        agreeTermsConditionsText = terms.data! ;
      }
    }
    else {
      print(response.reasonPhrase);
    }

  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Lottie.asset(
                "assets/animations/lo11.json",
                animate: true ,width: 160 ,height: 160 ),
          ),
        );
      },
    );
  }
  void _dissmisLoadingDialog() {
    Navigator.pop(context);
  }

}

class TopicAPI{
  int subject_id ;
  int grades_from ;
  int grades_to ;
  int main_subject ;
  TopicAPI({
  required this.subject_id ,
  required this.grades_from ,
  required this.grades_to ,
  required this.main_subject
  });
}
