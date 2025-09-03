import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';
import '../../services/sample_data_service.dart';
import '../offer/hot_offer_card.dart';

class HotOffersSection extends StatelessWidget {
  const HotOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hotOffers = SampleDataService.getAllHotOffers();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'hot_offers'.tr(),
          style: FontUtils.getBoldTextStyle(
            fontSize: 24,
            color: CupertinoColors.label,
          ),
        ),
        const SizedBox(height: AppConstants.mediumSpacing),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hotOffers.length,
          itemBuilder: (context, index) {
            return HotOfferCard(
              offer: hotOffers[index],
              onTap: () {
                // Handle offer tap
              },
            );
          },
        ),
      ],
    );
  }
}
