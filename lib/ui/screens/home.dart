import 'package:flutter/material.dart';
import 'package:meowdels/ui/screens/image_screen.dart';

import '../../app/urls.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 10,
          itemBuilder: (context, int index) {
            return InkWell(
                onTap: onTap,
                child: Image.network(Urls.catUrl));
          },
        ),
      ),
    );
  }
  void onTap(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreen(url: Urls.catUrl,)));
  }
}
