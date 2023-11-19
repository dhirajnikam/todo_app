import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitApp {
  void initScaffoldMessengerKey() {
    Get.put<GlobalKey<ScaffoldMessengerState>>(
      GlobalKey<ScaffoldMessengerState>(),
      permanent: true,
    );
  }
}
