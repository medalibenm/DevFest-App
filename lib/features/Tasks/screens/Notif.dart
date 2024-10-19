import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_therapist/features/Tasks/screens/widgets/notif_box.dart';
import 'package:my_therapist/features/Tasks/screens/widgets/notif_filter.dart';

import '../../../utils/constants/colors.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/logos/Logo.png'),
              SizedBox(
                height: 30,
              ),
              NotifFilter(),
              SizedBox(
                height: 20,
              ),
              NotifBox(),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text('Machine Temperature'),
                trailing: Icon(Iconsax.arrow_down_1),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text('Machine Temperature'),
                trailing: Icon(Iconsax.arrow_down_1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
