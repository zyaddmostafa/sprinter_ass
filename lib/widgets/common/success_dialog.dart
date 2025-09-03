import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../utils/font_utils.dart';

class SuccessDialog extends StatelessWidget {
  final String titleKey;
  final String contentKey;
  final VoidCallback onClose;

  const SuccessDialog({
    super.key,
    required this.titleKey,
    required this.contentKey,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        titleKey.tr(),
        style: FontUtils.getBoldTextStyle(fontSize: 18),
      ),
      content: Text(
        contentKey.tr(),
        style: FontUtils.getRegularTextStyle(fontSize: 16),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'close_button'.tr(),
            style: FontUtils.getMediumTextStyle(
              fontSize: 16,
              color: CupertinoColors.systemBlue,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onClose();
          },
        ),
      ],
    );
  }

  static void show({
    required BuildContext context,
    required String titleKey,
    required String contentKey,
    required VoidCallback onClose,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => SuccessDialog(
        titleKey: titleKey,
        contentKey: contentKey,
        onClose: onClose,
      ),
    );
  }
}
