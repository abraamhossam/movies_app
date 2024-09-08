import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/errors/failure.dart';

SnackbarController showSnakBar(Failure l) {
  return Get.snackbar(
    'Movies App',
    l.message.toString(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    duration: const Duration(seconds: 3),
    icon: const Icon(Icons.info, color: Colors.white),
  );
}
