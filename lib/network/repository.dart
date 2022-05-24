import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:randomapi/model/Modelclass.dart';

class Repository {
  List<FakeStore> collections = [];
  Future<List<FakeStore>?> getdata() async {
    String url = 'https://fakestoreapi.com/products';
    final data = await http.Client().get(Uri.parse(url));

    if (data.statusCode != 200) {
      return null;
    } else {
      Iterable values = jsonDecode(data.body);
      for (var value in values) {
        FakeStore fakeStore = FakeStore.fromJson(value);

        collections.add(fakeStore);
      }
      return collections;
    }
  }
}
