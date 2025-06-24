import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/images.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class AiDoctor extends StatefulWidget {
  const AiDoctor({super.key});

  @override
  State<AiDoctor> createState() => _AiDoctorState();
}

class _AiDoctorState extends State<AiDoctor> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  Future<void> _sendQuestion() async {
    setState(() => _isLoading = true);
    final question = _controller.text.trim();
    if (question.isEmpty) return;

    final response = await _getMedicalChatResponse(question);

    setState(() {
      _response = response;
      _isLoading = false;
    });
    _controller.clear();
  }

  Future<String> _getMedicalChatResponse(String question) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');

      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://graduationpro.runasp.net/api/Chats',
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

      final response = await dio.post(
        '/MedicalChat',
        data: {'question': question},
      );

      return response.data.toString();
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed(XServicesStrings.homeScreen),
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
                    SizedBox(width: XResponsive.xWidth(context) / 5.2),
                    Text(
                      XStrings.aiDoctor,
                      style: const TextStyle(
                        color: XColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: XResponsive.xHeight(context) / 50),
                Container(
                  width: double.infinity,
                  height: XResponsive.xHeight(context) / 1.18,
                  decoration: BoxDecoration(
                    color: XColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SingleChildScrollView(
                                  child: Text(
                                    _response,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: XResponsive.xHeight(context) / 15,
                              width: XResponsive.xWidth(context) / 1.4,
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  hintText: XStrings.chatting,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(
                                    Iconsax.microphone_copy,
                                    color: XColors.primary,
                                  ),
                                ),
                                onSubmitted: (_) => _sendQuestion(),
                              ),
                            ),
                            SizedBox(width: XResponsive.xWidth(context) / 40),
                            GestureDetector(
                              onTap: _sendQuestion,
                              child: CircleAvatar(
                                backgroundColor: XColors.primary,
                                minRadius: 24,
                                child: Image.asset(XImages.arrowIcon),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: XResponsive.xHeight(context) / 90),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
