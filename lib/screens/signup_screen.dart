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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    SuccessDialog.show(
      context: context,
      titleKey: 'success_title',
      contentKey: 'account_created',
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

  void _handleSignUp() {
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
          'sign_up_button'.tr(),
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
                  'create_account_title'.tr(),
                  style: FontUtils.getBoldTextStyle(
                    fontSize: 28,
                    color: CupertinoColors.label,
                  ),
                ),

                const SizedBox(height: AppConstants.smallSpacing),

                Text(
                  'create_account_subtitle'.tr(),
                  style: FontUtils.getRegularTextStyle(
                    fontSize: 16,
                    color: CupertinoColors.secondaryLabel,
                  ),
                ),

                const SizedBox(height: AppConstants.extraLargeSpacing),

                // Full Name Field
                CustomTextField(
                  controller: _fullNameController,
                  label: 'full_name_label'.tr(),
                  placeholder: 'full_name_placeholder'.tr(),
                  validator: ValidationUtils.validateFullName,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) {
                    if (value.isNotEmpty &&
                        value[0] != value[0].toUpperCase()) {
                      _fullNameController.selection =
                          TextSelection.fromPosition(
                        TextPosition(offset: _fullNameController.text.length),
                      );
                    }
                  },
                ),

                const SizedBox(height: AppConstants.mediumSpacing),

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

                const SizedBox(height: AppConstants.mediumSpacing),

                // Confirm Password Field
                CustomTextField(
                  controller: _confirmPasswordController,
                  label: 'confirm_password_label'.tr(),
                  placeholder: 'confirm_password_placeholder'.tr(),
                  validator: (value) => ValidationUtils.validateConfirmPassword(
                    _passwordController.text,
                    value,
                  ),
                  isPassword: true,
                  isPasswordVisible: _isConfirmPasswordVisible,
                  onTogglePassword: () {
                    setState(
                      () => _isConfirmPasswordVisible =
                          !_isConfirmPasswordVisible,
                    );
                  },
                ),

                const SizedBox(height: AppConstants.extraLargeSpacing),

                // Sign Up Button
                CustomButton(
                  text: 'create_account_button'.tr(),
                  onPressed: _handleSignUp,
                  isLoading: _isLoading,
                  isPrimary: true,
                ),

                const SizedBox(height: AppConstants.mediumSpacing),

                // Sign In Link
                AuthNavigationLink(
                  questionKey: 'already_have_account',
                  linkKey: 'sign_in_link',
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
