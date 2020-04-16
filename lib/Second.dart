import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_architecture/provider_architecture.dart';

import 'api_response_model.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeScreenViewModel>.withConsumer(
      viewModel: HomeScreenViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Networking like a boss!"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    viewModel.getDataFromAPI();
                  },
                  child: Text("Get Latest Data"),
                ),
                SizedBox(height: 8),
                viewModel.apiResponseModel != null
                    ? Text(
                        "Affected Countries : ${viewModel.apiResponseModel.affectedCountries}")
                    : Container(),
                viewModel.apiResponseModel != null
                    ? Text("Total Cases : ${viewModel.apiResponseModel.cases}")
                    : Container(),
                viewModel.apiResponseModel != null
                    ? Text(
                        "Total Deaths : ${viewModel.apiResponseModel.deaths}")
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeScreenViewModel extends ChangeNotifier {
  APIResponseModel apiResponseModel;

  void getDataFromAPI() async {
    apiResponseModel = await HomeScreenRepository().getDataFromAPI();
    print("Got data");
    notifyListeners();
  }
}

class HomeScreenRepository {
  Future<APIResponseModel> getDataFromAPI() async {
    const String API_URL = "https://corona.lmao.ninja/all";
    var response = await http.get(Uri.parse(API_URL));
    var parsedJson = await json.decode(response.body);
    APIResponseModel apiResponseModel = APIResponseModel.fromJson(parsedJson);
    return apiResponseModel;
  }
}
