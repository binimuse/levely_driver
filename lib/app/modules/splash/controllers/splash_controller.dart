import 'package:fcm_config/fcm_config.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lively_driver/Services/graphql_conf.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../data/muation.dart';

class SplashController extends GetxController {
  var acc;
  var role;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void checkIfLogin() async {
    final prefs = await SharedPreferences.getInstance();

    acc = prefs.getString('access_token');
    role = prefs.getString('role');

    if (acc != null) {
      //Get.offAllNamed(Routes.HOME);
      syncFcmToken();
    } else {
      //Get.offAllNamed(Routes.SIGN_IN);
      Get.offAllNamed(Routes.HOME);
      //  Get.toNamed(Routes.HOME);
    }
  }

  Future<void> syncFcmToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    print("fcmToken ${fcmToken.toString()}");

    if (fcmToken != null) {
      GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

      GraphQLClient client = graphQLConfiguration.clientToQuery();
      QueryResult result = await client.query(
        QueryOptions(
          document: gql(
            UpdateTokenMutation.updateToken,
          ),
          variables: <String, dynamic>{
            'token': fcmToken,
          },
        ),
      );

      if (!result.hasException) {
        print("haha ${result.data}");
      } else {}
    } else {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
