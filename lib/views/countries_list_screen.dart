import 'package:covid19_app_with_api/services/states_services.dart';
import 'package:covid19_app_with_api/views/detailedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search by Country Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: statesServices.fetchCountriesList(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: ((context, index) {
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  color: Colors.white,
                                  height: 10,
                                  width: 89,
                                ),
                                subtitle: Container(
                                  color: Colors.white,
                                  height: 10,
                                  width: 89,
                                ),
                                leading: Container(
                                  color: Colors.white,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ],
                          ));
                    }));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      String name = snapshot.data![index]['country'];
                      if (searchController.text.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailedScreen(
                                              countryName: snapshot.data![index]
                                                  ['country'],
                                              countryImage:
                                                  snapshot.data![index]
                                                      ['countryInfo']['flag'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              todayrecoverd:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                              test: snapshot.data![index]
                                                  ['tests'],
                                              totalcases: snapshot.data![index]
                                                  ['cases'],
                                              totaldeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalrecoverd: snapshot
                                                  .data![index]['recovered'],
                                            )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image.network(
                                  snapshot.data![index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailedScreen(
                                              countryName: snapshot.data![index]
                                                  ['country'],
                                              countryImage:
                                                  snapshot.data![index]
                                                      ['countryInfo']['flag'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              todayrecoverd:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                              test: snapshot.data![index]
                                                  ['tests'],
                                              totalcases: snapshot.data![index]
                                                  ['cases'],
                                              totaldeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalrecoverd: snapshot
                                                  .data![index]['recovered'],
                                            )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image.network(
                                  snapshot.data![index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }));
              }
            },
          ))
        ],
      )),
    );
  }
}
