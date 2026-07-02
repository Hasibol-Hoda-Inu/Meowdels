import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdels/app/controller_binder.dart';

import '../ui/screens/home.dart';

class Meowdels extends StatelessWidget {
  const Meowdels({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      home: HomeScreen(),
    );
  }
}
