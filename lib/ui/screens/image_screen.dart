import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdels/ui/controllers/save_media_controller.dart';

class ImageScreen extends StatefulWidget {
  final String url;
  const ImageScreen({
    super.key,
    required this.url,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {

  SaveMediaController saveMediaController = Get.find<SaveMediaController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full resolution image"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: .center,
          children: [
            Image.network(widget.url),
            GetBuilder<SaveMediaController>(
              builder: (controller) {
                if (controller.inProgress) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton.icon(
                  onPressed: saveImage,
                  label: Text(
                    "Download Image", style: TextStyle(fontSize: 18),),
                  icon: Icon(Icons.download, size: 20,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffe6739),
                    foregroundColor: Colors.white,
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveImage()async{
    final bool response = await saveMediaController.downLoadMedia(widget.url);
    if(response){
      Get.snackbar(
        "Meow!",
        "Your image is saved",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xfffe6739),
      );
    }else{
      Get.snackbar(
        "Meow!",
        "Failed to save image",
        backgroundColor: Colors.pinkAccent,
      );
    }
  }
}
