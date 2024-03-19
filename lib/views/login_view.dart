import 'package:cantos_flutter/providers/login_provider.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Constants.appWallpaper),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: Constants.colorPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const MyText(
                      Constants.textForContinue,
                      color: Constants.colorAccent,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Gap(20.0),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      Constants.appLogo,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 40),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Constants.colorPrimary,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: loginProvider.emailController,
                          decoration: const InputDecoration(
                            labelText: Constants.textEmail,
                            prefixIcon: Icon(Icons.person),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const Gap(15.0),
                        TextField(
                          controller: loginProvider.passwordController,
                          decoration: InputDecoration(
                            labelText: Constants.textPassword,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                loginProvider.isObscure ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () => loginProvider.toggleObscure(),
                            ),
                          ),
                          obscureText: loginProvider.isObscure,
                        ),
                        const Gap(30),
                        ElevatedButton(
                          onPressed: () {
                            loginProvider.login();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 50),
                            foregroundColor: Constants.colorTextPrimary,
                            backgroundColor: Constants.colorPrimaryDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const MyText(
                            Constants.textLogin,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(30),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: Constants.recoverPassword,
                              content: const TextField(
                                decoration: InputDecoration(
                                  labelText: Constants.textEmail,
                                  prefixIcon: Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              textConfirm: Constants.send,
                              textCancel: Constants.cancel,
                              confirmTextColor: Constants.colorTextPrimary,
                              buttonColor: Constants.colorPrimaryDark,
                              cancelTextColor: Constants.colorTextPrimary,
                              onConfirm: () => loginProvider.sendEmailForRecoverPassword(),
                            );
                          },
                          child: const MyText(
                            Constants.textForgotPassword,
                            textAlign: TextAlign.center,
                            fontSize: 12.0,
                          ),
                        ),
                        const Gap(20),
                        InkWell(
                          onTap: () => loginProvider.goToRegister(),
                          child: const MyText(
                            Constants.textRegister,
                            textAlign: TextAlign.center,
                            fontSize: 12.0,
                          ),
                        ),
                        const Gap(30.0),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                                color: Constants.colorDivider,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: MyText(
                                Constants.textOrLoginWith,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                                color: Constants.colorDivider,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20.0),
                        ElevatedButton(
                          onPressed: () => loginProvider.loginWithGoogle(),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 50),
                            foregroundColor: Constants.colorTextSecondary,
                            backgroundColor: Constants.colorBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Constants.googleIcon,
                                width: 20,
                                height: 20,
                              ),
                              const Gap(10),
                              const MyText(
                                Constants.textLoginWithGoogle,
                                color: Constants.colorTextSecondary, 
                                fontSize: 16.0, 
                                fontWeight: FontWeight.bold
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
