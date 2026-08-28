import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdels/ui/controllers/call_data_controller.dart';
import 'package:meowdels/ui/screens/image_screen.dart';
import 'package:meowdels/ui/widgets/alart_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      catImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: catImage,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Meowdels",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xfffe6739),
                ),
              ),
              Image.asset("assets/images/icon.png", width: 40,)
            ],
          ),
          actions: [
            IconButton(
              onPressed: catImage,
              icon: const Icon(Icons.refresh, color: Color(0xfffe6739),),
            ),
          ],
        ),
        body: GetBuilder<CallDataController>(
          builder: (controller) {
            if (controller.inProgress) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: controller.catImages.length,
                  itemBuilder: (context, int index) {
                    final cat = controller.catImages[index];
                    return InkWell(
                      onTap: () => onTap(cat.url ?? ""),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          cat.url ?? "",
                          fit: BoxFit.cover,
                          cacheWidth: 300,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void onTap(String link) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImageScreen(url: link)),
    );
  }

  Future<void> catImage() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      if (mounted) {
        showDialog(context: context, builder: (context) => const AlertBox());
      }
      return;
    }

    final success = await Get.find<CallDataController>().getCatImage();
    if (success) {
      Get.snackbar(
        "Meow!",
        "Your cat images are here",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xfffe6739),
      );
    } else {
      Get.snackbar(
        "Meow!",
        "Failed to get cat images",
        backgroundColor: Colors.pinkAccent,
      );
    }
  }
}
