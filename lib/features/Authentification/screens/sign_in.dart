import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_therapist/features/Authentification/controller/signin_controller.dart';
import 'package:my_therapist/features/Authentification/screens/register.dart';
import 'package:my_therapist/features/Authentification/screens/widgets/social.dart';
import 'package:my_therapist/utils/constants/colors.dart';
import 'package:my_therapist/utils/constants/sizes.dart';

class signInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Login Here',
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
                'Welcome back you\'ve',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'been missed!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              Form(
                  key: controller.signupFormKey,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot your password?',
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
                                controller.LoginClick();
                              },
                              child: Text('Sign in'))),
                      SizedBox(
                        height: TSizes.spaceBtwSections / 3,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Get.offAll(() => RegisterScreen());
                          },
                          child: Text('Dont have an account ?',
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
                        height: 20,
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
