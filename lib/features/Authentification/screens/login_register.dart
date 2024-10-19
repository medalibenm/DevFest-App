import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_therapist/features/Authentification/screens/register.dart';
import 'package:my_therapist/features/Authentification/screens/sign_in.dart';
import 'package:my_therapist/utils/constants/colors.dart';
import 'package:my_therapist/utils/constants/sizes.dart';

class loginRegister extends StatelessWidget {
  const loginRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Image(image: AssetImage('assets/images/welcome image.png')),
              Container(
                width: 300,
                child: Text(
                  'Car Manufacturing App',
                  style: GoogleFonts.poppins(
                    color: TColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Container(
                width: 310,
                child: Text(
                  'Let this app be your personal assistant, providing you with tasks and timely reminders.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => signInScreen());
                          },
                          child: Text('Login'))),
                  SizedBox(
                    width: TSizes.spaceBtwItems * 2,
                  ),
                  SizedBox(
                      width: 150,
                      child: TextButton(
                          onPressed: () {
                            Get.to(() => RegisterScreen());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: TColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
