import 'package:flutter/cupertino.dart';
import 'package:networking_like_a_boss/screens/home/home_repository.dart';
import '../../model/api_response_model.dart';

class HomeScreenViewModel extends ChangeNotifier {
  APIResponseModel apiResponseModel;
  bool isLoading = false;

  void getDataFromAPI() async {
    /// Start showing the loader
    isLoading = true;
    notifyListeners();

    /// Wait for response
    apiResponseModel = await HomeScreenRepository().getLatestStatsData();
    notifyListeners();

    /// Stop the loader
    isLoading = false;
    notifyListeners();
  }
}
