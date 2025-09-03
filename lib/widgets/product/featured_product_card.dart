import 'package:flutter/cupertino.dart';
import 'package:sprinter_ass/widgets/product/product_image.dart';
import '../../models/product_model.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';

class FeaturedProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const FeaturedProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: AppConstants.smallSpacing),
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          child: Stack(
            children: [
              // Product Image
              Container(
                width: double.infinity,
                height: AppConstants.featuredProductsHeight,
                color: CupertinoColors.systemGrey5,
                child: ProductImage(product: product),
              ),

              // Product Title Overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(AppConstants.mediumSpacing),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        CupertinoColors.systemBackground.withValues(alpha: 0.0),
                        CupertinoColors.systemBackground.withValues(alpha: 0.9),
                      ],
                    ),
                  ),
                  child: Text(
                    product.title,
                    style: FontUtils.getBoldTextStyle(
                      fontSize: 18,
                      color: CupertinoColors.label,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
