import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage,
  });
}

class NetworkCaller{
  Future<NetworkResponse> getRequest(String url)async{
    try{
      Uri uri = Uri.parse(url);
      Response response = await get(uri);

      final int status = response.statusCode;
      final dynamic body = response.body;

      if(status == 200){
        final decodedData = jsonDecode(response.body);
        debugPrint("✅SUCCESS: StatusCode: $status ResponseBody: $body");
        return NetworkResponse(statusCode: status, isSuccess: true, responseData: decodedData);
      }else{
        debugPrint("❌FAILED: StatusCode: $status ResponseBody: $body");
        return NetworkResponse(statusCode: status, isSuccess: false, errorMessage: "Try again");
      }
    }catch(e){
      debugPrint("❌ERROR: ${e.toString()}");
      return NetworkResponse(statusCode: -1, isSuccess: false, errorMessage: e.toString());
    }
  }
}
