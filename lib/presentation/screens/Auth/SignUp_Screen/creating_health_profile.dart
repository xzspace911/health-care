// --- CreatingHealthProfile Page (UI) ---

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:health_care/core/controllers/general_info_controller.dart';

class CreatingHealthProfile extends StatefulWidget {
  const CreatingHealthProfile({super.key});

  @override
  _CreatingHealthProfileState createState() => _CreatingHealthProfileState();
}

class _CreatingHealthProfileState extends State<CreatingHealthProfile> {
  final GeneralInfoController generalInfoController =
      Get.put(GeneralInfoController());

  Map<String, int> diseaseMap = {
    'High blood pressure': 1,
    'Heart disease': 2,
    'Diabetes': 3,
  };

  List<String> diseaseItems = [
    'Select Your Disease',
    'High blood pressure',
    'Heart disease',
    'Diabetes'
  ];
  List<String> genderItems = ['Male', 'Female'];
  List<String> choiceItems = ['Yes', 'No'];

  String? selectedDisease = 'Select Your Disease';
  String? selectedGender = 'Male';
  String? selectedSmoking = 'No';
  String? selectedFamily = 'No';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: XResponsive.xHeight(context) / 1.3,
                decoration: BoxDecoration(
                  color: XColors.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: XResponsive.xHeight(context) / 26),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: XResponsive.xWidth(context) / 7.5,
                              height: XResponsive.xHeight(context) / 16,
                              decoration: BoxDecoration(
                                color: XColors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Iconsax.arrow_left_2_copy,
                                color: XColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: XResponsive.xWidth(context) / 23),
                          Text(
                            XStrings.createHealthProfile,
                            style: TextStyle(
                              color: XColors.white,
                              fontSize: XResponsive.xHeight(context) / 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Container(
                  height: XResponsive.xHeight(context) / 1.4,
                  width: XResponsive.xWidth(context),
                  decoration: BoxDecoration(
                    color: XColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 8),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller:
                              generalInfoController.doctorEmailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                            label: Text(XStrings.doctorEmail),
                            prefixIcon: Icon(Iconsax.personalcard_copy),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          value: selectedDisease,
                          onChanged: (value) {
                            setState(() {
                              selectedDisease = value;
                              generalInfoController.diseaseController.text =
                                  diseaseMap[value!] != null
                                      ? diseaseMap[value!].toString()
                                      : '0';
                            });
                          },
                          items: diseaseItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        TextField(
                          controller: generalInfoController.dateOfBirthController,
                          readOnly: true,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (date != null) {
                              generalInfoController.dateOfBirthController.text =
                                  date.toIso8601String();
                            }
                          },
                          decoration: InputDecoration(
                            labelText: XStrings.dateOfBirth,
                            suffixIcon: Icon(Iconsax.calendar,
                            color: XColors.primary,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller:
                                    generalInfoController.heightController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  label: Text(XStrings.height),
                                  suffixIcon: Icon(Iconsax.ruler,
                                      color: XColors.primary),
                                ),
                                keyboardType: TextInputType.numberWithOptions(),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                controller:
                                    generalInfoController.weightController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  label: Text(XStrings.weight),
                                  suffixIcon: Icon(Iconsax.weight,
                                      color: XColors.primary),
                                ),
                                keyboardType: TextInputType.numberWithOptions(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        Text(XStrings.selectYourGender),
                        DropdownButtonFormField<String>(
                          value: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                              generalInfoController.genderController.text =
                                  value!;
                            });
                          },
                          items: genderItems
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        Text(XStrings.smoking),
                        DropdownButtonFormField<String>(
                          value: selectedSmoking,
                          onChanged: (value) {
                            setState(() {
                              selectedSmoking = value;
                              generalInfoController.hasSmokingController.text =
                                  value!;
                            });
                          },
                          items: choiceItems
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 70),
                        Text(XStrings.chronicDiseases),
                        DropdownButtonFormField<String>(
                          value: selectedFamily,
                          onChanged: (value) {
                            setState(() {
                              selectedFamily = value;
                              generalInfoController.hasFamilyController.text =
                                  value!;
                            });
                          },
                          items: choiceItems
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  ))
                              .toList(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: XResponsive.xHeight(context) / 1.1,
                left: XResponsive.xWidth(context) / 14,
                child: SizedBox(
                  height: 50,
                  width: 325,
                  child: ElevatedButton(
                    onPressed: () =>
                        generalInfoController.registerGeneralInfo(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(XColors.primary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: Text(
                      XStrings.createYourProfile,
                      style: TextStyle(
                        color: XColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
