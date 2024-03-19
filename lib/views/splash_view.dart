import 'package:cantos_flutter/providers/splash_provider.dart';
import 'package:cantos_flutter/utils/constans.dart';
import 'package:cantos_flutter/widgets/my_loading.dart';
import 'package:cantos_flutter/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Constants.appWallpaper),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 110.0,
                backgroundImage: AssetImage(Constants.appLogo),
              ),
              const Gap(20.0),
              const MyText(
                Constants.appName,
                color: Constants.colorTextPrimary,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const Gap(20.0),
              const MyText(
                '${Constants.textDevelopedBy}\n${Constants.textDeveloper}',
                color: Constants.colorTextPrimary,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const Gap(20.0),
              const MyText(
                Constants.appVersion,
                color: Constants.colorTextPrimary,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const Gap(30),
              Builder(builder: (context) {
                final splashProvider = Provider.of<SplashProvider>(context);
                return splashProvider.isLoaded
                    ? const MyLoading()
                    : const Gap(0);
              })
            ],
          ),
        ),
      ),
    );
  }
}
