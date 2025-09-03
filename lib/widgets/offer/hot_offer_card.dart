import 'package:flutter/cupertino.dart';
import '../../models/hot_offer_model.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';

class HotOfferCard extends StatelessWidget {
  final HotOffer offer;
  final VoidCallback? onTap;

  const HotOfferCard({
    super.key,
    required this.offer,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstants.mediumSpacing),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
              blurRadius: AppConstants.smallShadowBlur,
              offset: const Offset(0, AppConstants.smallShadowOffset),
            ),
          ],
        ),
        child: Row(
          children: [
            // Offer Image
            Container(
              width: AppConstants.hotOfferImageSize,
              height: AppConstants.hotOfferImageSize,
              decoration: BoxDecoration(
                color: CupertinoColors.systemOrange.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.mediumRadius),
                  bottomLeft: Radius.circular(AppConstants.mediumRadius),
                ),
              ),
              child: _buildOfferImage(),
            ),

            // Offer Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.mediumSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (offer.title.isNotEmpty) ...[
                      Text(
                        offer.title,
                        style: FontUtils.getBoldTextStyle(
                          fontSize: 16,
                          color: CupertinoColors.label,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppConstants.smallSpacing),
                    ],
                    Text(
                      offer.description,
                      style: FontUtils.getMediumTextStyle(
                        fontSize: 14,
                        color: CupertinoColors.label,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (offer.expiryDate != null) ...[
                      const SizedBox(height: AppConstants.smallSpacing),
                      _buildExpiryInfo(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferImage() {
    // For now, using placeholder icon
    // In production, you would use Image.network or Image.asset
    return Icon(
      CupertinoIcons.tag_fill,
      size: AppConstants.largeIconSize,
      color: CupertinoColors.systemOrange,
    );
  }

  Widget _buildExpiryInfo() {
    final now = DateTime.now();
    final expiry = offer.expiryDate!;
    final daysLeft = expiry.difference(now).inDays;

    String expiryText;
    Color expiryColor;

    if (daysLeft < 0) {
      expiryText = 'Expired';
      expiryColor = CupertinoColors.systemRed;
    } else if (daysLeft == 0) {
      expiryText = 'Expires today';
      expiryColor = CupertinoColors.systemOrange;
    } else if (daysLeft == 1) {
      expiryText = 'Expires tomorrow';
      expiryColor = CupertinoColors.systemOrange;
    } else {
      expiryText = 'Expires in $daysLeft days';
      expiryColor = CupertinoColors.systemGrey;
    }

    return Row(
      children: [
        Icon(
          CupertinoIcons.clock,
          size: AppConstants.smallIconSize,
          color: expiryColor,
        ),
        const SizedBox(width: AppConstants.smallSpacing),
        Text(
          expiryText,
          style: FontUtils.getRegularTextStyle(
            fontSize: 12,
            color: expiryColor,
          ),
        ),
      ],
    );
  }
}
