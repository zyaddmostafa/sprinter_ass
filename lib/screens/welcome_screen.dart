import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/font_utils.dart';
import '../constants/app_constants.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/image_display_widget.dart';
import '../widgets/language_switcher.dart';
import 'signup_screen.dart';
import 'signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'app_title'.tr(),
          style: FontUtils.getBoldTextStyle(
            fontSize: 24,
            color: CupertinoColors.systemBlue,
          ),
        ),
        trailing: LanguageSwitcher(),
        backgroundColor: CupertinoColors.systemBackground,
        border: const Border(
          bottom: BorderSide(color: CupertinoColors.separator, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.largePadding),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppConstants.extraLargeSpacing),

                Text(
                  'welcome_title'.tr(),
                  style: FontUtils.getBoldTextStyle(
                    fontSize: 36,
                    color: CupertinoColors.systemBlue,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppConstants.mediumSpacing),

                Text(
                  'welcome_subtitle'.tr(),
                  style: FontUtils.getRegularTextStyle(
                    fontSize: 18,
                    color: CupertinoColors.secondaryLabel,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppConstants.extraLargeSpacing),

                // Row with two images
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cached Network Image
                    ImageDisplayWidget(
                      imageUrl:
                          'https://media.gettyimages.com/id/1460761187/photo/yeaaaah-i-have-won-the-match.jpg?s=612x612&w=gi&k=20&c=Bl68vSbTiVDMn511RXm-QMYMFdh2Xhiafdk2W-9TQsE=',
                      width: 120,
                      height: 120,
                    ),

                    // Assets Image
                    ImageDisplayWidget(
                      assetPath: 'assets/images/setup.jpg',
                      width: 120,
                      height: 120,
                    ),
                  ],
                ),

                const SizedBox(height: AppConstants.hugeSpacing),

                // Sign Up Button
                CustomButton(
                  text: 'sign_up_button'.tr(),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  isPrimary: true,
                ),

                const SizedBox(height: AppConstants.mediumSpacing),

                // Sign In Button
                CustomButton(
                  text: 'sign_in_button'.tr(),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: AppConstants.extraLargeSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
