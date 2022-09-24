import 'dart:ui';

import 'package:eschool_teacher/app/routes.dart';
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

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  ImagePickerController _controller = Get.put(ImagePickerController());

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

  RangeValues values = RangeValues(0.9, 1.0);
  String _work = 'yes';

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

  bool accept = false;

  bool checked = false;
  bool desapila = false;

  bool arabic = false;
  bool math = false;
  bool sciences = false;
  bool history = false;
  bool geography = false;
  bool scientific_culture = false;
  bool physic = false;
  bool chemistry = false;
  bool biology = false;
  bool english = false;
  bool islamic = false;
  bool technology = false;

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
                MyTextField(
                  maxLine: 3,
                  
                  controller: _emailTextController,
                  label: UiUtils.getTranslatedLabel(context, emailKey),
                   
                  helperText: UiUtils.getTranslatedLabel(
                      context, enterVerifiedAccountKey )
                      
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  textInputType: TextInputType.number,
                  controller: _idNationalTextController,
                  label:
                      UiUtils.getTranslatedLabel(context, NationalIdNumberKey),
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
                MyTextField(
                    controller: _addressTextController,
                    label: UiUtils.getTranslatedLabel(context, villageKey),
                    helperText: UiUtils.getTranslatedLabel(
                        context, enterVillageNotExistsKey)),
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
                MyTextField(
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
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
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
              ],
            ),
          ),
        ),
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: Text(
                UiUtils.getTranslatedLabel(context, chooseSubjectsClassesKey)),
            content: Column(
              children: [
                ChooseSubject(
                    translatedKey: arabicKey,
                    subjectValue: arabic,
                    rangeValues: _currentRangeValues,
                    work: _work),
                ChooseSubject(
                    translatedKey: englishKey,
                    subjectValue: english,
                    rangeValues: _currentRangeValues12,
                    work: _work12),
                ChooseSubject(
                    translatedKey: mathKey,
                    subjectValue: math,
                    rangeValues: _currentRangeValues2,
                    work: _work2),
                ChooseSubject(
                    translatedKey: sciencesKey,
                    subjectValue: sciences,
                    rangeValues: _currentRangeValues3,
                    work: _work3),
                ChooseSubject(
                    translatedKey: islamicKey,
                    subjectValue: islamic,
                    rangeValues: _currentRangeValues4,
                    work: _work4),
                ChooseSubject(
                    translatedKey: technologyKey,
                    subjectValue: technology,
                    rangeValues: _currentRangeValues5,
                    work: _work5),
                ChooseSubject(
                    translatedKey: biologyKey,
                    subjectValue: biology,
                    rangeValues: _currentRangeValues6,
                    work: _work6),
                ChooseSubject(
                    translatedKey: chemistryKey,
                    subjectValue: chemistry,
                    rangeValues: _currentRangeValues7,
                    work: _work7),
                ChooseSubject(
                    translatedKey: physicKey,
                    subjectValue: physic,
                    rangeValues: _currentRangeValues8,
                    work: _work8),
                ChooseSubject(
                    translatedKey: scientificCultureKey,
                    subjectValue: scientific_culture,
                    rangeValues: _currentRangeValues9,
                    work: _work9),
                ChooseSubject(
                    translatedKey: historyKey,
                    subjectValue: history,
                    rangeValues: _currentRangeValues10,
                    work: _work10),
                ChooseSubject(
                    translatedKey: geographyKey,
                    subjectValue: geography,
                    rangeValues: _currentRangeValues11,
                    work: _work11),
              ],
            )),
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
                          groupValue: _work,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _work = value);
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
                          groupValue: _work,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _work = value);
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
                  _work == 'no'
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
                Container(
                  child: GetBuilder<ImagePickerController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: _controller.urlId != null
                            ? InkWell(
                                onTap: () {
                                  _controller.getImageFromGallaryId();
                                },
                                child: Image.file(_controller.urlId))
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
                        child: _controller.urlYours != null
                            ? InkWell(
                                onTap: () {
                                  _controller.getImageFromGallaryYours();
                                },
                                child: Image.file(_controller.urlYours))
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
                        child: _controller.url != null
                            ? InkWell(
                                onTap: () {
                                  _controller.getImageFromGallary();
                                },
                                child: Image.file(_controller.url))
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
              Text(
                '1) An Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws..',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '2) A Termination clause will inform users that any accounts on your website and mobile app, or users access to your website and app, can be terminated in case of abuses or at your sole discretion. Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.',
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '3)  Governing Law clause will inform users which laws govern the agreement. These laws should come from the country in which your company is headquartered or the country from which you operate your website and mobile app Intellectual Property clause will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws.',
              ),
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
      body: Stepper(
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
          } else {
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
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkPersonalData()) {
      if (_images()) {
        Navigator.of(context).pushReplacementNamed(Routes.login);
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
    } else {
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

  bool _images() {
    if (_controller.urlYours != null &&
        _controller.urlId != null &&
        _controller.url != null) {
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
}
