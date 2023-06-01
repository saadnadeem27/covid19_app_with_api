import 'dart:convert';

import 'package:covid19_app_with_api/models/countries_list_model.dart';
import 'package:covid19_app_with_api/models/world_states_model.dart';
import 'package:covid19_app_with_api/services/utilities/app_url.dart';
import 'package:covid19_app_with_api/views/countries_list_screen.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecord() async {
    http.Client client = http.Client();
    Uri uri = Uri.parse(AppUrl.worldStatesApi);
    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCountriesList() async {
    http.Client client = http.Client();
    Uri uri = Uri.parse(AppUrl.countriesList);
    http.Response response = await client.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
