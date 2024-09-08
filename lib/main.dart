import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Features/home/presentations/view/views/home_view.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/functions/hive_init.dart';
import 'package:movies_app/core/utils/functions/setup_service_locator.dart';
import 'package:movies_app/core/utils/my_bindings.dart';
import 'package:movies_app/core/utils/pages.dart';

void main() async {
  setupServiceLocator();
  await hiveInit();

  runApp(
    const MoviesApp(),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      initialRoute: HomeView.id,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      getPages: pages,
    );
  }
}
