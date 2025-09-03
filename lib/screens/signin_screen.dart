import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/font_utils.dart';
import '../utils/validation_utils.dart';
import '../constants/app_constants.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/custom_text_field.dart';
import '../widgets/common/success_dialog.dart';
import '../widgets/auth/auth_navigation_link.dart';
import 'shopping_home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    SuccessDialog.show(
      context: context,
      titleKey: 'success_title',
      contentKey: 'account_signed_in',
      onClose: _navigateToShoppingHome,
    );
  }

  void _navigateToShoppingHome() async {
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ShoppingHomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: AppConstants.fadeAnimationDuration,
        ),
      );
    }
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate API call
      Future.delayed(AppConstants.apiSimulationDelay, () {
        setState(() => _isLoading = false);
        _showSuccessDialog();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'sign_in_button'.tr(),
          style: FontUtils.getBoldTextStyle(
            fontSize: 20,
            color: CupertinoColors.systemBlue,
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
        border: const Border(
          bottom: BorderSide(color: CupertinoColors.separator, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.largePadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppConstants.mediumSpacing),

                // Welcome Text
                Text(
                  'welcome_back_title'.tr(),
                  style: FontUtils.getBoldTextStyle(
                    fontSize: 28,
                    color: CupertinoColors.label,
                  ),
                ),

                const SizedBox(height: AppConstants.smallSpacing),

                Text(
                  'welcome_back_subtitle'.tr(),
                  style: FontUtils.getRegularTextStyle(
                    fontSize: 16,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),

                const SizedBox(height: AppConstants.extraLargeSpacing),

                // Email Field
                CustomTextField(
                  controller: _emailController,
                  label: 'email_label'.tr(),
                  placeholder: 'email_placeholder'.tr(),
                  validator: ValidationUtils.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: AppConstants.mediumSpacing),

                // Password Field
                CustomTextField(
                  controller: _passwordController,
                  label: 'password_label'.tr(),
                  placeholder: 'password_placeholder'.tr(),
                  validator: ValidationUtils.validatePassword,
                  isPassword: true,
                  isPasswordVisible: _isPasswordVisible,
                  onTogglePassword: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                ),

                const SizedBox(height: AppConstants.extraLargeSpacing),

                // Sign In Button
                CustomButton(
                  text: 'sign_in_button'.tr(),
                  onPressed: _handleSignIn,
                  isLoading: _isLoading,
                  isPrimary: true,
                ),

                const SizedBox(height: AppConstants.mediumSpacing),

                // Sign Up Link
                AuthNavigationLink(
                  questionKey: 'dont_have_account',
                  linkKey: 'sign_up_link',
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
