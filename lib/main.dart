import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:health_care/core/services/app_router.dart';

void main() {
  runApp(HealthCare(appRouter: AppRouter()));
}

class HealthCare extends StatelessWidget {
  const HealthCare({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,

    );
  }
}
