import 'dart:ui';
import 'package:eschool_teacher/app/routes.dart';
import 'package:eschool_teacher/utils/api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
import '../../../data/models/RegisterTeacherModel.dart';
import '../../../data/models/getTermsConditionModel.dart';
import '../../../data/models/subjectListModel.dart';

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

                          controller: _firstNameTextController,
                          label: UiUtils.getTranslatedLabel(
                              context, firstNameKey )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyTextField(
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
                                  hintText: UiUtils.getTranslatedLabel(
                                      context, phoneNumberKey),
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
                            color: Colors.grey.shade200,
                            border: Border.all(
                                color: Color.fromARGB(200, 204, 185, 155), width: 2)),
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
                      DateTime? newDate = await showDatePicker(
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
                                  UiUtils.getTranslatedLabel(
                                      context, enterYourBirthdayKey),
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
                      UiUtils.getTranslatedLabel(context, chooseCityKey),
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
                      UiUtils.getTranslatedLabel(context, chooseVillageKey),
                    ),
                    underline: Divider(
                      thickness: 0,
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedSubCity = value;
                      });
                    },
                    value: selectedSubCity,
                    items: RamallahSubCitiesAr.map((e) => DropdownMenuItem(
                          child: Text("${e}"),
                          value: e,
                        )).toList(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: MyTextField(
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
                MyTextField(
                  controller: _skillsTextController,
                  label: UiUtils.getTranslatedLabel(
                      context, talkAboutYourSkillsKey),
                  minLine: 5,
                  maxLine: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: _experienceWorkTextController,
                  label: UiUtils.getTranslatedLabel(
                      context, talkAboutYourExperienceKey),
                  minLine: 5,
                  maxLine: 10,
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
                      controller: _previousWorkTextController,
                      label:
                          UiUtils.getTranslatedLabel(context, previousWorkKey)),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                      controller: _previousWorkPlaceTextController,
                      label: UiUtils.getTranslatedLabel(
                          context, previousWorkPlaceKey)),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
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

  Column staticTopic() {
    return Column(
            children: [
              /// subject-1
              if(subjectList.length > 0)
              ChooseSubjectAllData(
                  translatedKey: subjectList[0].name,
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
                  translatedKey: subjectList[1].name,
                  subjectValue: subject1,
                  rangeValues: _currentRangeValues12,
                  callBack: (bool value){
                    setState(() {
                      subject1 = value;
                    });
                  },
                  callBackRange: (RangeValues values){
                    setState(() {
                      _currentRangeValues12 = values;
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
                  translatedKey: subjectList[2].name,
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
                  translatedKey: subjectList[3].name,
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
                  translatedKey: subjectList[4].name,
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
                  translatedKey: subjectList[5].name,
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
                  translatedKey: subjectList[6].name,
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
                  translatedKey: subjectList[7].name,
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
                  translatedKey: subjectList[8].name,
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
                  translatedKey: subjectList[9].name,
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
                  translatedKey: subjectList[10].name,
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
                  translatedKey: subjectList[11].name,
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
      subjectId: subjectList[0].id,
      from: _currentRangeValues.start.toInt(),
      to: _currentRangeValues.end.toInt(),
      work: _work,
    );

    /// subject-12
    if(subjectList.length > 1)
    addTopic(
      topic: subject1,
      subjectId: subjectList[1].id,
      from: _currentRangeValues12.start.toInt(),
      to: _currentRangeValues12.end.toInt(),
      work: _work1,
    );

    /// subject-2
    if(subjectList.length > 2)
    addTopic(
      topic: subject2,
      subjectId: subjectList[2].id,
      from: _currentRangeValues2.start.toInt(),
      to: _currentRangeValues2.end.toInt(),
      work: _work2,
    );

    /// subject-3
    if(subjectList.length > 3)
    addTopic(
      topic: subject3,
      subjectId: subjectList[3].id,
      from: _currentRangeValues3.start.toInt(),
      to: _currentRangeValues3.end.toInt(),
      work: _work3,
    );
    /// subject-4
    if(subjectList.length > 4)
    addTopic(
      topic: subject4,
      subjectId: subjectList[4].id,
      from: _currentRangeValues4.start.toInt(),
      to: _currentRangeValues4.end.toInt(),
      work: _work4,
    );

    /// subject-5
    if(subjectList.length > 5)
    addTopic(
      topic: subject5,
      subjectId: subjectList[5].id,
      from: _currentRangeValues5.start.toInt(),
      to: _currentRangeValues5.end.toInt(),
      work: _work5,
    );

    /// subject-6
    if(subjectList.length > 6)
    addTopic(
      topic: subject6,
      subjectId: subjectList[6].id,
      from: _currentRangeValues6.start.toInt(),
      to: _currentRangeValues6.end.toInt(),
      work: _work6,
    );

    /// subject-7
    if(subjectList.length > 7)
    addTopic(
      topic: subject7,
      subjectId: subjectList[7].id,
      from: _currentRangeValues7.start.toInt(),
      to: _currentRangeValues7.end.toInt(),
      work: _work7,
    );

    /// subject-8
    if(subjectList.length > 8)
    addTopic(
      topic: subject8,
      subjectId: subjectList[8].id,
      from: _currentRangeValues8.start.toInt(),
      to: _currentRangeValues8.end.toInt(),
      work: _work8,
    );

    /// subject-9
    if(subjectList.length > 9)
    addTopic(
      topic: subject9,
      subjectId: subjectList[9].id,
      from: _currentRangeValues9.start.toInt(),
      to: _currentRangeValues9.end.toInt(),
      work: _work9,
    );

    /// subject-10
    if(subjectList.length > 10)
    addTopic(
      topic: subject10,
      subjectId: subjectList[10].id,
      from: _currentRangeValues10.start.toInt(),
      to: _currentRangeValues10.end.toInt(),
      work: _work10,
    );

    /// subject-11
    if(subjectList.length > 11)
    addTopic(
      topic: subject11,
      subjectId: subjectList[11].id,
      from: _currentRangeValues11.start.toInt(),
      to: _currentRangeValues11.end.toInt(),
      work: _work11,
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
          EasyLoading.show(status: "Loading...") ;
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
      'bio': '${_skillsTextController.text}',
      'experience': '${_experienceWorkTextController.text}',
      'country': '${dropdownCities}',
      'village': '${_addressTextController.text}',
      'e_contact_name': '${_emergencyNameTextController.text}',
      'e_contact_number': '${_emergencyNumberTextController.text}',
      'previous_work': '${_previousWorkTextController.text}',
      'previous_work_number': '${_previousWorkNumberTextController.text}',
      'p_work_place': '${_previousWorkPlaceTextController.text}',
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





      // 'subject_ids[0]': '1',
      // 'grades_from[0]': '5',
      // 'grades_to[0]': '9',
      // 'main_subjects[0]': '1'
    });
    request.files.add(await http.MultipartFile.fromPath('national_id_photo', '${_controller.IdImage?.path}'));
    request.files.add(await http.MultipartFile.fromPath('certificate', '${_controller.certificateImage?.path}'));
    request.files.add(await http.MultipartFile.fromPath('doc_lack_crimes', '${_controller.unCrimeImage?.path}'));
    request.files.add(await http.MultipartFile.fromPath('profile', '${_controller.profileImage?.path}'));


    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString() ;
    final registerTeacher = registerTeacherFromJson(res);
    if (response.statusCode == 200) {
      // print(registerTeacher.error == true);
      if(registerTeacher.error != null && registerTeacher.error == true){
        EasyLoading.showError("${registerTeacher.message}") ;
      }else{
        EasyLoading.showSuccess("${registerTeacher.message}") ;
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  bool _images() {
    if (_controller.IdImage != null &&
        _controller.profileImage != null &&
        _controller.certificateImage != null &&
        _controller.unCrimeImage != null) {
      return true;
    }

    return false;
  }

  bool _checkPersonalData() {
    if (_firstNameTextController.text.isNotEmpty &&
        _lastNameTextController.text.isNotEmpty &&
        _idNationalTextController.text.isNotEmpty &&
        _emergencyNameTextController.text.isNotEmpty &&
        _emergencyNumberTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _previousWorkTextController.text.isNotEmpty &&
        _previousWorkPlaceTextController.text.isNotEmpty &&
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
    var request = http.Request('GET', Uri.parse('${Api.termsCondition}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String res = (await response.stream.bytesToString());
    final terms = getTermsConditionModelFromJson(res);
    if (response.statusCode == 200) {
      if(terms.error == false){
        agreeTermsConditionsText = terms.data ;
      }
    }
    else {
      print(response.reasonPhrase);
    }

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
