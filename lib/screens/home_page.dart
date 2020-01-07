import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_test/common_data.dart';
import 'package:http_request_test/http_library.dart';
import 'package:http_request_test/screens/post_list.dart';
import 'package:http_request_test/screens/post_list_with_filter.dart';
import 'package:http_request_test/widgets/user_login_input.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  //region all web api data
//  String url = "https://jsonplaceholder.typicode.com/posts";

  String urlPost = "https://mytechhuntapp.herokuapp.com/api/auth/login/";

  String url = "${HttpLibrary.baseUrl}${HttpLibrary.urlStateList}";

  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));

    var bodyData = {'username': 'SdAamer', 'password': 'A@asdf1234'};
    var res = await http
        .post(Uri.encodeFull(urlPost), body: jsonEncode(bodyData), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      print('Login Successfull');
    } else if (res.statusCode == 404) {
      print('plesae check user name and password');
    } else if (res.statusCode == 400) {
      print('not Found');
    } else {
      print('Oppppsss');
    }

//    if (response.statusCode == 200) {
//      print(jsonDecode(response.body));
//      var mData = StateList.fromJson(jsonDecode(response.body));
//      for (var i = 1; i < mData.statelist.length; i++) {
//        print(mData.statelist[i].record.statename);
//      }
//    } else if (response.statusCode == 404) {
//      print('Server Not found please try later');
//    }
  }

  //endregion
  Future<String> _userLogin(String username, String password) async {
    print(username);
    print(password);

//    var bodyData = {'username': 'SdAamer', 'password': 'A@asdf1234'};
    var bodyData = {'username': username, 'password': password};
    var res = await http
        .post(Uri.encodeFull(urlPost), body: jsonEncode(bodyData), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      CommonData.createToast(message: 'Login Successfull', context: context);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return PostListWithFilter();
      }));
      print('Login Successfull');
    } else if (res.statusCode == 404) {
      CommonData.createToast(
          message: 'plesae check user name and password', context: context);
      print('plesae check user name and password');
    } else if (res.statusCode == 400) {
      CommonData.createToast(message: 'not Found', context: context);
      print('not Found');
    } else {
      CommonData.createToast(message: 'Oppppsss', context: context);
      print('Oppppsss');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Reqesy'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            UserLoginInput(_userLogin),
          ],
        ),
      ),
    );
  }
}
