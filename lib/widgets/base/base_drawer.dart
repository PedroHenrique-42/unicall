import 'package:flutter/material.dart';
import 'package:unicall/constants/base_colors.dart';
import 'package:unicall/constants/navigation_routes.dart';
import 'package:unicall/constants/strings.dart';
import 'package:unicall/screens/register_screen.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryYellow,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(logoPath, height: 100),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, homeScreen);
              },
              leading: const Icon(
                Icons.home,
                color: secondaryBlue,
              ),
              title: Text(
                baseDrawerHomeScreenText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Divider(thickness: 0.5, color: Colors.black54, height: 0.5),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return RegisterScreen(
                      action: registerAction,
                    );
                  },
                ));
              },
              leading: const Icon(
                Icons.app_registration_rounded,
                color: secondaryBlue,
              ),
              title: Text(
                baseDrawerRegisterScreenText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Divider(thickness: 0.5, color: Colors.black54, height: 0.5),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, registerListScreen);
              },
              leading: const Icon(
                Icons.featured_play_list_rounded,
                color: secondaryBlue,
              ),
              title: Text(
                baseDrawerListScreenText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
