import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CreatingHealthProfile extends StatefulWidget {
  const CreatingHealthProfile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatingHealthProfileState createState() => _CreatingHealthProfileState();
}

class _CreatingHealthProfileState extends State<CreatingHealthProfile> {
  List<String> items = [
    'Select Your Disease',
    'High blood pressure',
    'Heart disease',
    'Diabetes'
  ];
  String? selectedItem = 'Select Your Disease';
  List<String> gender = ['Male', 'Female'];
  List<String> choice = ['Yes', 'No'];

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
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Container(
                  height: XResponsive.xHeight(context)/1.44,
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
                        SizedBox(
                          height: XResponsive.xHeight(context) / 15,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              label: Text(XStrings.doctorEmail),
                              prefixIcon: Icon(Iconsax.personalcard_copy),
                            ),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        SizedBox(
                          height: XResponsive.xHeight(context) / 15,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(color: XColors.primary)),
                            ),
                            value: items.contains(selectedItem)
                                ? selectedItem
                                : 'Select Your Disease', // Ensure valid value
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem = newValue; // Update the selected value
                              });
                            },
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        SizedBox(
                          height: XResponsive.xHeight(context) / 15,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              label: Text(XStrings.dateOfBirth),
                              suffixIcon: Icon(
                                Iconsax.calendar,
                                color: XColors.primary,
                              ),
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: XResponsive.xWidth(context) / 2.65,
                              height: XResponsive.xHeight(context) / 16,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  label: Text(XStrings.height),
                                  suffixIcon: Icon(
                                    Iconsax.ruler,
                                    color: XColors.primary,
                                  ),
                                ),
                                keyboardType:
                                    TextInputType.numberWithOptions(),
                              ),
                            ),
                            SizedBox(
                              width: XResponsive.xWidth(context) / 2.6,
                              height: XResponsive.xHeight(context) / 16,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  label: Text(XStrings.weight),
                                  suffixIcon: Icon(
                                    Iconsax.weight,
                                    color: XColors.primary,
                                  ),
                                ),
                                keyboardType:
                                    TextInputType.numberWithOptions(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        Text(XStrings.selectYourGender),
                        SizedBox(height: XResponsive.xHeight(context) / 80),
                        SizedBox(
                          height: XResponsive.xHeight(context) / 16,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(color: XColors.primary)),
                            ),
                            value: gender.contains(selectedItem)
                                ? selectedItem
                                : 'Male', // Ensure valid value
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem = newValue; // Update the selected value
                              });
                            },
                            items: gender
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 60),
                        Text(XStrings.smoking),
                        SizedBox(height: XResponsive.xHeight(context) / 90),
                        SizedBox(
                          width: double.infinity,
                          height: XResponsive.xHeight(context) / 16,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(color: XColors.primary)),
                            ),
                            value: choice.contains(selectedItem)
                                ? selectedItem
                                : 'No', // Ensure valid value
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem =
                                    newValue; // Update the selected value
                              });
                            },
                            items: choice
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 70),
                        Text(
                          XStrings.chronicDiseases,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 100),
                        SizedBox(
                          width: double.infinity,
                          height: XResponsive.xHeight(context) / 16,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(color: XColors.primary)),
                            ),
                            value: choice.contains(selectedItem)
                                ? selectedItem
                                : 'No',
                            // Ensure valid value
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem =
                                    newValue; // Update the selected value
                              });
                            },
                            items: choice
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: XResponsive.xHeight(context)/1.15,
                left: XResponsive.xWidth(context)/14,
                child: SizedBox(
                  height: 50,
                  width: 325,
                  child: ElevatedButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(XServicesStrings.loginScreen),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(XColors.primary),
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
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
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
