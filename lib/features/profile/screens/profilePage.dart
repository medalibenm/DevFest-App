import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/logos/Logo.png'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Profile',
                style: GoogleFonts.urbanist(
                    color: Color(0xff171950),
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kesbi Walid',
                            style: GoogleFonts.urbanist(
                                color: Color(0xff171950),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'wa***kb@gma',
                            style: GoogleFonts.urbanist(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Edit',
                        style: GoogleFonts.urbanist(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Iconsax.arrow_right_3,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Account Settings'),
                leading: Icon(Iconsax.setting_2),
                trailing: Icon(
                  Iconsax.arrow_right_3,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Privacy Settings'),
                leading: Icon(Iconsax.shield),
                trailing: Icon(
                  Iconsax.arrow_right_3,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(),
              SizedBox(
                height: 170,
              ),
              Text(
                'More',
                style: GoogleFonts.urbanist(
                    color: Color(0xff171950),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text('Help & Support'),
                leading: Icon(Iconsax.info_circle),
                trailing: Icon(
                  Iconsax.arrow_right_3,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Contact Us'),
                leading: Icon(Iconsax.call),
                trailing: Icon(
                  Iconsax.arrow_right_3,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
