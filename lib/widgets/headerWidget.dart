import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/global_controller.dart';

class Headerr extends StatefulWidget {
  const Headerr({super.key});

  @override
  State<Headerr> createState() => _HeaderrState();
}

class _HeaderrState extends State<Headerr> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  String city = "";

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.subLocality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            city,
            style: GoogleFonts.blackHanSans(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent),
          ),
        )
      ],
    );
  }
}
