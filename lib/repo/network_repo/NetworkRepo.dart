import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:networking_like_a_boss/model/api_response_model.dart';
import 'package:networking_like_a_boss/utils/constants.dart';

class NetworkRepo {
  Future<APIResponseModel> getLatestDataFromAPI() async {
    var response = await http.get(Uri.parse(API_END_POINT_URL));
    var parsedJson = await json.decode(response.body);
    APIResponseModel apiResponseModel = APIResponseModel.fromJson(parsedJson);
    return apiResponseModel;
  }
}
