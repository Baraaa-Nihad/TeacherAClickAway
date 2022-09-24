import 'package:eschool_teacher/ui/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/labelKeys.dart';
import '../../utils/uiUtils.dart';

// class ChooseSubject extends StatefulWidget {
//   bool subjectValue;
//   String work;
//   RangeValues rangeValues;
//   final String translatedKey;
//   final Function() onTap;
//
//   ChooseSubject(
//       {required this.subjectValue,
//       required this.rangeValues,
//       required this.translatedKey,
//       required this.onTap,
//       required this.work});
//
//   @override
//   State<ChooseSubject> createState() => _ChooseSubjectState();
// }
//
// class _ChooseSubjectState extends State<ChooseSubject> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CheckboxListTile(
//           activeColor: Color.fromARGB(200, 204, 185, 155),
//           title: Text(
//             UiUtils.getTranslatedLabel(context,  translatedKey),
//             // style: GoogleFonts.poppins(fontSize: 16),
//           ),
//           value:  subjectValue,
//           onChanged: (value) {
//             setState(() {
//                subjectValue = value!;
//
//             });
//           },
//         ),
//          subjectValue
//             ? Column(
//                 children: [
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(
//                         child: RadioListTile(
//                           activeColor: Color.fromARGB(200, 204, 185, 155),
//                           title: Text(
//                             UiUtils.getTranslatedLabel(context, mainSubjectKey),
//                             // style: GoogleFonts.poppins(
//                             //     // textStyle: TextStyle(fontSize: 18)
//                             //     ),
//                           ),
//                           value: 'yes',
//                           groupValue:  work,
//                           onChanged: (String? value) {
//                             if (value != null) {
//                               setState(() =>  work = value);
//                             }
//                           },
//                         ),
//                       ),
//                       Expanded(
//                         child: RadioListTile(
//                           activeColor: Color.fromARGB(200, 204, 185, 155),
//                           title: Text(
//                             UiUtils.getTranslatedLabel(
//                                 context, SubMainSubjectKey),
//                             // style: GoogleFonts.poppins(
//                             //     // textStyle: TextStyle(fontSize: 18)
//                             //     )
// //
//                           ),
//                           value: 'no',
//                           groupValue:  work,
//                           onChanged: (String? value) {
//                             if (value != null) {
//                               setState(() =>  work = value);
//                             }
//                           },
//                         ),
//                       ),
//
//                       // Expanded(child: getCityName(),)
//                       const SizedBox(height: 20),
//
//                       Container(
//                         color: Colors.red,
//                         height: 50,
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   RangeSlider(
//                     activeColor: Color.fromARGB(200, 204, 185, 155),
//                     inactiveColor: Colors.grey.shade300,
//                     values:  rangeValues,
//                     max: 12,
//                     min: 1,
//                     divisions: 12,
//                     labels: RangeLabels(
//                        rangeValues.start.round().toString(),
//                        rangeValues.end.round().toString(),
//                     ),
//                     onChanged: (RangeValues values) {
//                       setState(() {
//                          rangeValues = values;
//                       });
//                     },
//                   ),
//                   Text(
//                       '${UiUtils.getTranslatedLabel(context, levelKey)} ${ rangeValues.start.toInt()} ${UiUtils.getTranslatedLabel(context, toLevelKey)}${ rangeValues.end.toInt()}'),
//                   // Divider(indent: 40, endIndent: 40,),
//                 ],
//               )
//             : SizedBox(),
//       ],
//     );
//   }
// }

class ChooseSubject extends StatefulWidget {
  bool subjectValue;
  String work;
  RangeValues rangeValues;
  final String translatedKey;

  ChooseSubject(
      {required this.subjectValue,
      required this.rangeValues,
      required this.translatedKey,
      required this.work});

  @override
  State<ChooseSubject> createState() => _ChooseSubjectState();
}

class _ChooseSubjectState extends State<ChooseSubject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: Color.fromARGB(200, 204, 185, 155),
          title: Text(
            UiUtils.getTranslatedLabel(context, widget.translatedKey),
             style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12)
                                )
            // style: GoogleFonts.poppins(fontSize: 16),
          ),
          value: widget.subjectValue,
          onChanged: (value) {
            setState(() {
              widget.subjectValue = value!;
            });
          },
        ),
        widget.subjectValue
            ? Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: RadioListTile(
                          activeColor: Color.fromARGB(200, 204, 185, 155),
                          title: Text(
                            UiUtils.getTranslatedLabel(context, mainSubjectKey),
                            style: GoogleFonts.cairo (
                                 textStyle: TextStyle(fontSize: 10)
                                ),
                          ),
                          value: 'yes',
                          groupValue: widget.work,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                widget.work = value;
                              });
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: Color.fromARGB(200, 204, 185, 155),
                          title: Text(
                            UiUtils.getTranslatedLabel(
                                context, SubMainSubjectKey),
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 10)
                                )

                          ),
                          value: 'no',
                          groupValue: widget.work,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() {
                                widget.work = value;
                              });
                            }
                          },
                        ),
                      ),

                      // Expanded(child: getCityName(),)
                      const SizedBox(height: 20),

                      Container(
                        color: Colors.red,
                        height: 50,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RangeSlider(
                    activeColor: Color.fromARGB(200, 204, 185, 155),
                    inactiveColor: Colors.grey.shade300,
                    values: widget.rangeValues,
                    max: 12,
                    min: 1,
                    divisions: 12,
                    labels: RangeLabels(
                      widget.rangeValues.start.round().toString(),
                      widget.rangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        widget.rangeValues = values;
                      });
                    },
                  ),
                  Text(
                      '${UiUtils.getTranslatedLabel(context, levelKey)} ${widget.rangeValues.start.toInt()} ${UiUtils.getTranslatedLabel(context, toLevelKey)} ${widget.rangeValues.end.toInt()}',  style: GoogleFonts.cairo(
                                textStyle: TextStyle(fontSize: 12,color: Color.fromARGB(255, 5, 30, 73))
                                ),),
                  // Divider(indent: 40, endIndent: 40,),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
