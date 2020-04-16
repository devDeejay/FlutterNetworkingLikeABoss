import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_response_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  APIResponseModel apiResponseModel;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text("Networking Example"),
          ),
          body: Container(child: Center(child: buildDataWidget())),
          floatingActionButton: FloatingActionButton(
            child: isLoading
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : Icon(Icons.cloud_download),
            tooltip: "Get Data from API",
            onPressed: () => getDataFromAPI(),
          ),
        )));
  }

  void getDataFromAPI() async {
    setState(() {
      isLoading = true;
    });
    const String API_URL = "https://corona.lmao.ninja/v2/all";
    var response = await http.get(Uri.parse(API_URL));
    var parsedJson = await json.decode(response.body);
    setState(() {
      apiResponseModel = APIResponseModel.fromJson(parsedJson);
      isLoading = false;
    });
  }

  buildDataWidget() {
    if (apiResponseModel == null)
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Press the floating action button to get data",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      );
    else {
      return Text(
        "Total Cases : ${apiResponseModel.cases}\n"
        "Today's Cases : ${apiResponseModel.todayCases}\n"
        "Total Deaths : ${apiResponseModel.deaths}\n"
        "Today's Deaths : ${apiResponseModel.todayDeaths}\n"
        "Total Recovered : ${apiResponseModel.recovered}\n"
        "Active Cases : ${apiResponseModel.active}\n"
        "Critical Cases : ${apiResponseModel.critical}\n"
        "Cases per million: ${apiResponseModel.casesPerOneMillion}\n"
        "Deaths per million: ${apiResponseModel.deathsPerOneMillion}\n"
        "Total Tests Done: ${apiResponseModel.tests}\n"
        "Tests per million: ${apiResponseModel.testsPerOneMillion}\n"
        "Affected countires : ${apiResponseModel.affectedCountries}\n",
        style: TextStyle(fontSize: 18),
      );
    }
  }
}
