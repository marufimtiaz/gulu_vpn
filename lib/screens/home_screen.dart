import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulu_vpn/main.dart';
import '../app_preferences/app_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  locationSelectionBottomNavigation(BuildContext context) {
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: screenSize.height * 0.08,
            color: Colors.teal,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on_outlined),
                Text(
                  "Select Location",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.arrow_circle_right_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Vpn"),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_outlined),
            onPressed: () {
              Get.changeThemeMode(
                AppPreferences.isModeDark ? ThemeMode.light : ThemeMode.dark,
              );
              AppPreferences.isModeDark = !AppPreferences.isModeDark;
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Hello World",
          // style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: locationSelectionBottomNavigation(context),
    );
  }
}
