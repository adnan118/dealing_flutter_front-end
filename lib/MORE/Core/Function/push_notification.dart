import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/connectors/v1.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

class Push_notification {
  static Future<String> getAccessToken() async {
    final servicesAccountJson = {
    
    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(servicesAccountJson), scopes);
    //get access token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(servicesAccountJson),
            scopes,
            client);
    client.close();
    return credentials.accessToken.data;
  }

  static   sendNotification(
      String deviceToken, BuildContext context, String orderID) async {
    final String serverAccessTokenKey = await getAccessToken();
    String endpointFirbaseCloudMessaging =
        "https://fcm.googleapis.com/v1/projects/smc1-e200d/messages:send";
    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': 'test',
          'body': 'body test'
        },
        'data':{
          'orderID':orderID,
        }
      }
    };
    final http.Response response = await http.post(Uri.parse(endpointFirbaseCloudMessaging),headers:<String , String>{
      'Content-Type':'application/json',
      'Authorization':'Bearer $serverAccessTokenKey'
    },
    body: jsonEncode(message)
    );
    if(response.statusCode==200){
      print("Notification sent Successfully");
    }else{
      print("Failed,Notification    msg=>${response.statusCode}");
    }
  }
}
