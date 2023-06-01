import 'package:covid19_app_with_api/views/world_states_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailedScreen extends StatefulWidget {
  String countryName;
  String countryImage;
  int totalcases;
  int totaldeaths;
  int totalrecoverd;
  int active;
  int critical;
  int todayrecoverd;
  int test;

  DetailedScreen({
    Key? key,
    required this.countryName,
    required this.countryImage,
    required this.active,
    required this.critical,
    required this.todayrecoverd,
    required this.totalcases,
    required this.totaldeaths,
    required this.totalrecoverd,
    required this.test,
  }) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(
                          title: 'Total Cases',
                          value: widget.totalcases.toString()),
                      ReusableRow(
                          title: 'Total Deaths',
                          value: widget.totaldeaths.toString()),
                      ReusableRow(
                          title: 'Total Recoverd',
                          value: widget.totalrecoverd.toString()),
                      ReusableRow(
                          title: 'Active Cases',
                          value: widget.active.toString()),
                      ReusableRow(
                          title: 'Today Recoverd',
                          value: widget.todayrecoverd.toString()),
                      ReusableRow(
                          title: 'Critical Cases',
                          value: widget.critical.toString()),
                      ReusableRow(
                          title: 'Total Tests', value: widget.test.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.countryImage),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
