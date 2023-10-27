import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/model_class.dart';

class DataController extends GetxController {
  var data = <Datum>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {

      isLoading(true);

      final response = await http.get(
          Uri.parse("https://mbl.downloadvid.app/api/data/"),
          headers: {
            'Accept-Encoding': 'gzip, deflate, br',  // if this header is not passed still no problem
      }
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final dataModel = dataModelFromJson(response.body);
        data.value = dataModel.data!;
        print("this is api response: ");
        for (var item in data) {
          print(item); // This will print each Datum object separately
        }
      }
      // .... condition to be used if you have to handle token expiry

      // else if (response.statusCode ==  400 ) {    // this condition works when token is Expired so we need to remove it from local storage
      //
      //   LogoutController logoutController = Get.put(LogoutController());
      //
      //   var errrorMessage = "Token expired. Please log in again";
      //
      //   logoutController.handleLogout();
      //
      //   throw Exception(errrorMessage);
      //
      // }
      else {
        throw Exception('Failed to load data');
      }
    } on Exception catch (e) {
      print("Error fetching data: $e");
      Get.snackbar(
          "Error",
          e.toString(),
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.red,            // when 'backgroundGradient' is used then this 'backgroundColor' will not work
          titleText: const Text("Notification"),       // will overwrite the 'Error'
          messageText: Text(e.toString()),  //this will overwrite the e.toString() provided above
          colorText: Colors.black,
          backgroundGradient: const LinearGradient(colors: [Color(0xff004880),Colors.white]),

          isDismissible: true,
          dismissDirection: DismissDirection.horizontal
      );
    } finally{
      isLoading(false);
    }
  }


}
