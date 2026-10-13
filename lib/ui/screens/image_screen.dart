import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdels/ui/controllers/save_media_controller.dart';
import 'package:meowdels/ui/widgets/shimmer_loading.dart';

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
      backgroundColor: Color(0xffFAF6FE),
      appBar: AppBar(
        title: Text("Full resolution image"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: .center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6B547D).withValues(alpha: 0.10),
                      blurRadius: 24,
                      spreadRadius: 0,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    imageUrl: widget.url,
                    placeholder: (context, url) => const ShimmerLoadingWidget(),
                    errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                  ),
                ),
              ),
              GetBuilder<SaveMediaController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return CircularProgressIndicator();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFE6739)
                                .withValues(alpha: 0.25),
                            blurRadius: 24,
                            spreadRadius: 0,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: saveImage,
                        icon: const Icon(Icons.download, size: 22),
                        label: const Text(
                          "Download Image",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFE6739),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  );

                  // return ElevatedButton.icon(
                  //   onPressed: saveImage,
                  //   label: Text(
                  //     "Download Image", style: TextStyle(fontSize: 18),
                  //   ),
                  //   icon: Icon(Icons.download, size: 20,),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Color(0xfffe6739),
                  //     foregroundColor: Colors.white,
                  //     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  //   ),
                  // );
                }
              )
            ],
          ),
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
