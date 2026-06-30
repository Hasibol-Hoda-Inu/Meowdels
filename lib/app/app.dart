import 'package:flutter/material.dart';

import '../ui/screens/home.dart';

class Meowdels extends StatelessWidget {
  const Meowdels({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
