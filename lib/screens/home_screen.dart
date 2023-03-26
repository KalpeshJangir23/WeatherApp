import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/colorss.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call the globalcontroller method
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainbackground,
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Headerr(),
                  ],
                ),
        ),
      ),
    );
  }
}