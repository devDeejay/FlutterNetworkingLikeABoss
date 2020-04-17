import 'package:networking_like_a_boss/model/api_response_model.dart';
import 'package:networking_like_a_boss/repo/network_repo/NetworkRepo.dart';

class HomeScreenRepository {
  /// ViewModel calls its Repository to getLatestStatsData
  /// The Repository will take care of getting the data from thr right source
  /// ViewModel doesn't care if its coming from API or Offline Cache

  Future<APIResponseModel> getLatestStatsData() {
    return NetworkRepo().getLatestDataFromAPI();
  }
}
