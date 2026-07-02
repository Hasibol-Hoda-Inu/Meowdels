import 'package:get/get.dart';
import 'package:meowdels/data_model/cat_image_data_model.dart';
import 'package:meowdels/services/api_service.dart';

import '../../app/urls.dart';

class CallDataController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  List<CatImageDataModel> _catImages = [];
  List<CatImageDataModel> get catImages => _catImages;

  Future<bool> getCatImage()async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.catUrl);
    if(response.isSuccess){
      isSuccess = true;
      _catImages = (response.responseData as List)
          .map((e)=>CatImageDataModel.fromJson(e)).toList();
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}