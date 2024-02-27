import 'package:demo_firebase11_12/home/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../api/product_api.dart';

class ServiceProductAPI {
  Future fetchProductAPI() async {
    try {
      var response = await http.get(Uri.parse(productAPI));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
