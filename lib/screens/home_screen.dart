import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulu_vpn/all_widgets/circle_widget.dart';
import 'package:gulu_vpn/main.dart';
import '../app_preferences/app_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    // Create an observable variable
    isDark = AppPreferences.isModeDark.obs;
  }

  // Declare a late RxBool variable
  late final RxBool isDark;

  locationSelectionBottomNavigation(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Semantics(
          button: true,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: screenSize.height * 0.08,
              color: isDark.value ? Colors.teal.shade700 : Colors.teal,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.white),
                  Text(
                    "Select Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_circle_right_outlined, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget vpnRoundButton(BuildContext context) {
    return Obx(
      () => Semantics(
        button: true,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark.value ? Colors.teal.shade500 : Colors.teal.shade200,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color:
                    isDark.value ? Colors.teal.shade600 : Colors.teal.shade300,
                shape: BoxShape.circle,
              ),
              child: Container(
                width: screenSize.width * 0.3,
                height: screenSize.width * 0.3,
                decoration: BoxDecoration(
                  color: isDark.value
                      ? Colors.teal.shade800
                      : Colors.teal.shade500,
                  shape: BoxShape.circle,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Connect",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
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
        title: const Text("Free Vpn", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_outlined, color: Colors.white),
            onPressed: () {
              Get.changeThemeMode(
                AppPreferences.isModeDark ? ThemeMode.light : ThemeMode.dark,
              );
              AppPreferences.isModeDark = !AppPreferences.isModeDark;
              isDark.value = AppPreferences.isModeDark;
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleWidget(
                  title: 'Country',
                  subtitle: 'Free',
                  iconWidget: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.flag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleWidget(
                  title: '60 ms',
                  subtitle: 'PING',
                  iconWidget: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.black54,
                    child: Icon(
                      Icons.graphic_eq,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            vpnRoundButton(context),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleWidget(
                  title: '100 kbps',
                  subtitle: 'Download',
                  iconWidget: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.arrow_circle_down_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleWidget(
                  title: '100 kbps',
                  subtitle: 'Upload',
                  iconWidget: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.arrow_circle_up_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: locationSelectionBottomNavigation(context),
    );
  }
}
