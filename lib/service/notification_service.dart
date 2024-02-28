import 'package:dio/dio.dart';
import 'package:rbf_flutter_task/http_cleint/api_clients.dart';

class NotificationService {
  // get Campaign Details list
  static Future<dynamic> getNotification() async {

  var rNotification= ApiClients.getJson("{{base_url}}/get_notification?page=1&pageSize=5");
  }


/*  static Future<dynamic> testPost({
    required int id,
    required int name,
    required int num,
  }) async {
    Map<String, dynamic> pBody = {
      "addressBookId": id,
      "fullName": name,
      "mobileNumber": num,
    };
    var response = BaseClient.postData(
      api: 'post-data',
      body: pBody,
    );
    return response;
  }*/
}