import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    final isArabic = currentLocale.languageCode == 'ar';

    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: () {
        _showLanguageDialog(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            CupertinoIcons.globe,
            size: 16,
            color: CupertinoColors.systemBlue,
          ),
          const SizedBox(width: 6),
          Text(
            isArabic ? 'مصري' : 'English',
            style: const TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'اختر اللغة / Choose Language',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            _buildLanguageOption(
              context,
              'English',
              'English',
              const Locale('en', 'US'),
            ),
            const SizedBox(height: 12),
            _buildLanguageOption(
              context,
              'مصري',
              'Egyptian Arabic',
              const Locale('ar', 'EG'),
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              'إلغاء / Cancel',
              style: TextStyle(
                color: CupertinoColors.systemRed,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String nativeName,
    String englishName,
    Locale locale,
  ) {
    final currentLocale = context.locale;
    final isSelected = currentLocale.languageCode == locale.languageCode;

    return GestureDetector(
      onTap: () {
        context.setLocale(locale);
        Navigator.of(context).pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? CupertinoColors.systemBlue.withValues(alpha: 0.1)
              : CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? CupertinoColors.systemBlue
                : CupertinoColors.systemGrey4,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nativeName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? CupertinoColors.systemBlue
                          : CupertinoColors.label,
                    ),
                  ),
                  Text(
                    englishName,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? CupertinoColors.systemBlue.withValues(alpha: 0.7)
                          : CupertinoColors.secondaryLabel,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: CupertinoColors.systemBlue,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
