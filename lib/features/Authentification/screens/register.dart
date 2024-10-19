import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_therapist/features/Authentification/controller/register_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_therapist/features/Authentification/screens/sign_in.dart';
import 'package:my_therapist/features/Authentification/screens/widgets/social.dart';
import 'package:my_therapist/utils/constants/colors.dart';
import 'package:my_therapist/utils/constants/sizes.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Register',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(color: TColors.primary),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                'Join us now !',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              Form(
                  key: controller.RegisterFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.username,
                        decoration: InputDecoration(
                          labelText: '   Username',
                        ),
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems * 1.5,
                      ),
                      TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          labelText: '   Email',
                        ),
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems * 1.5,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          obscureText: controller.passwordEye.value,
                          decoration: InputDecoration(
                              labelText: '   Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.passwordEye.value =
                                      !controller.passwordEye.value;
                                },
                                icon: controller.passwordEye.value
                                    ? Icon(Iconsax.eye_slash)
                                    : Icon(Iconsax.eye),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Checkbox(
                                value: controller.privacyPolicy.value,
                                onChanged: (value) {
                                  controller.privacyPolicy.value =
                                      !controller.privacyPolicy.value;
                                }),
                          ),
                          Text(
                            'I Agree to the privacy policy',
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                                  color: TColors.primary,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.registerClick();
                              },
                              child: Text('Register'))),
                      SizedBox(
                        height: TSizes.spaceBtwSections / 3,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Get.offAll(() => signInScreen());
                          },
                          child: Text('Already have an account ?',
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwSections * 1,
                      ),
                      Text(
                        'Or continue with',
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: TColors.primary,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Social(
                            image: 'assets/logos/google-icon.png',
                          ),
                          SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Social(image: 'assets/logos/facebook-icon.png')
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
