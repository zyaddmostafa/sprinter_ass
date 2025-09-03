import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';
import '../../services/sample_data_service.dart';
import '../product/product_card.dart';

class ProductGridSection extends StatelessWidget {
  final VoidCallback? onAddToCart;

  const ProductGridSection({
    super.key,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final allProducts = SampleDataService.getAllProducts();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'all_products'.tr(),
          style: FontUtils.getBoldTextStyle(
            fontSize: 24,
            color: CupertinoColors.label,
          ),
        ),
        const SizedBox(height: AppConstants.mediumSpacing),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppConstants.productGridCrossAxisCount,
            crossAxisSpacing: AppConstants.mediumSpacing,
            mainAxisSpacing: AppConstants.mediumSpacing,
            childAspectRatio: AppConstants.productGridChildAspectRatio,
          ),
          itemCount: allProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: allProducts[index],
              onAddToCart: onAddToCart,
              onTap: () {
                // Handle product tap
              },
            );
          },
        ),
      ],
    );
  }
}
