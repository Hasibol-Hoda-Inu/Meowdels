import 'package:get/get.dart';
import 'package:meowdels/services/api_service.dart';
import 'package:meowdels/ui/controllers/call_data_controller.dart';
import 'package:meowdels/ui/controllers/save_media_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkCaller());
    Get.put(CallDataController());
    Get.put(SaveMediaController());
  }

}
