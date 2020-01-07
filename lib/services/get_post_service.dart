import 'dart:ui';

import 'package:http_request_test/model/post_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../http_library.dart';

class GetPostService {
  static String url = "${HttpLibrary.myBaseUrl}${HttpLibrary.urlAllPostsList}";

//  List<PostData> itemsList = List();

  static Future<List<PostData>> getAllPostData() async {
    var response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      List<PostData> itemsList =
          List<PostData>.from(mData.map((i) => PostData.fromJson(i)));
      return itemsList;
    } else if (response.statusCode == 404) {
      print('Server Not found please try later');
    }
  }
}
