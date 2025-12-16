import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_application/models/image_model.dart';

// handles all image collection logic
class ImageRepository {
  static Future<List<ImageModel>> getNetworkImages() async {
    List<ImageModel> images = [];
    final endpointUrl = Uri.parse("https://pixelford.com/api2/images");
    final response = await http.get(endpointUrl);

    if (response.statusCode != 200) {
      throw HttpException("unable to call API");
    } else {
      // decode the json using jsonDecode
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      // now that u have a list of json object, u gotta map it to class entities
      images = jsonResponse.map((entry) {
        return ImageModel.fromJson(entry);
      }).toList();

      return images;
    }
  }
}
