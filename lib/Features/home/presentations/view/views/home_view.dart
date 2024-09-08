import 'package:flutter/material.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/home_view_body.dart';
import 'package:movies_app/core/utils/size_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "/HomeView";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
