import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/font_utils.dart';
import '../constants/app_constants.dart';
import '../widgets/home/featured_products_section.dart';
import '../widgets/home/product_grid_section.dart';
import '../widgets/home/hot_offers_section.dart';
import '../utils/snackbar_utils.dart';

class ShoppingHomeScreen extends StatefulWidget {
  const ShoppingHomeScreen({super.key});

  @override
  State<ShoppingHomeScreen> createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  void _showAddedToCartSnackBar() {
    SnackBarUtils.showCupertinoSnackBar(
      context: context,
      message: 'item_added_to_cart'.tr(),
      backgroundColor: CupertinoColors.systemGreen,
      textColor: CupertinoColors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'our_products'.tr(),
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
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Products Section
              const FeaturedProductsSection(),

              const SizedBox(height: AppConstants.largeSpacing),

              // Product Grid Section
              ProductGridSection(
                onAddToCart: _showAddedToCartSnackBar,
              ),

              const SizedBox(height: AppConstants.largeSpacing),

              // Hot Offers Section
              const HotOffersSection(),

              const SizedBox(height: AppConstants.mediumSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
