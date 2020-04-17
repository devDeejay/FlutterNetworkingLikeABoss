import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking_like_a_boss/screens/home/home_screen_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../model/api_response_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeScreenViewModel>.withConsumer(
        viewModel: HomeScreenViewModel(),
        builder: (context, viewModel, child) {
          return Container(
              color: Colors.white,
              child: SafeArea(
                  child: Scaffold(
                appBar: buildAppBar(),
                body: buildBody(viewModel),
                floatingActionButton: buildFloatingActionButton(viewModel),
              )));
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Networking Like a Pro"),
    );
  }

  Widget buildBody(HomeScreenViewModel homeScreenViewModel) {
    /// building our UI
    /// notice we are observing viewModel.apiResponseModel
    /// Hence buildDataWidget will rebuild when apiResponse changes in ViewModel
    return Container(
        child: Center(
            child: buildDataWidget(homeScreenViewModel.apiResponseModel)));
  }

  FloatingActionButton buildFloatingActionButton(
      HomeScreenViewModel homeScreenViewModel) {
    return FloatingActionButton(
      child: homeScreenViewModel.isLoading
          ? CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : Icon(Icons.cloud_download),
      tooltip: "Get Data from API",

      /// Calling our viewModel function
      onPressed: () => homeScreenViewModel.getDataFromAPI(),
    );
  }

  buildDataWidget(APIResponseModel apiResponseModel) {
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
