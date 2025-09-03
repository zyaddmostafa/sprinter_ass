import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../utils/font_utils.dart';

class AuthNavigationLink extends StatelessWidget {
  final String questionKey;
  final String linkKey;
  final VoidCallback onTap;

  const AuthNavigationLink({
    super.key,
    required this.questionKey,
    required this.linkKey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionKey.tr(),
          style: FontUtils.getRegularTextStyle(
            fontSize: 16,
            color: CupertinoColors.secondaryLabel,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            linkKey.tr(),
            style: FontUtils.getBoldTextStyle(
              fontSize: 16,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ),
      ],
    );
  }
}
