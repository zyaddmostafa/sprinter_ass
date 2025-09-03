import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';
import '../../services/sample_data_service.dart';
import '../common/page_indicator.dart';
import '../product/featured_product_card.dart';

class FeaturedProductsSection extends StatefulWidget {
  const FeaturedProductsSection({super.key});

  @override
  State<FeaturedProductsSection> createState() =>
      _FeaturedProductsSectionState();
}

class _FeaturedProductsSectionState extends State<FeaturedProductsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featuredProducts = SampleDataService.getFeaturedProducts();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'featured_products'.tr(),
          style: FontUtils.getBoldTextStyle(
            fontSize: 24,
            color: CupertinoColors.label,
          ),
        ),

        const SizedBox(height: AppConstants.mediumSpacing),

        SizedBox(
          height: AppConstants.featuredProductsHeight,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              return FeaturedProductCard(
                product: featuredProducts[index],
                onTap: () {
                  // Handle product tap
                },
              );
            },
          ),
        ),

        const SizedBox(height: AppConstants.mediumSpacing),

        // Page Indicator
        PageIndicator(
          currentPage: _currentPage,
          totalPages: featuredProducts.length,
        ),
      ],
    );
  }
}
