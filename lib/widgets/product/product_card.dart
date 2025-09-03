import 'package:flutter/cupertino.dart';
import 'package:sprinter_ass/widgets/product/product_image.dart';
import '../../models/product_model.dart';
import '../../utils/font_utils.dart';
import '../../constants/app_constants.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCart;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onAddToCart,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(AppConstants.largeRadius),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withValues(alpha: 0.1),
              blurRadius: AppConstants.mediumShadowBlur,
              offset: const Offset(0, AppConstants.smallShadowOffset),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.largeRadius),
                        topRight: Radius.circular(AppConstants.largeRadius),
                      ),
                    ),
                    child: ProductImage(product: product),
                  ),
                ),

                // Product Info
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.mediumSpacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: FontUtils.getBoldTextStyle(
                            fontSize: 14,
                            color: CupertinoColors.label,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppConstants.smallSpacing),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: FontUtils.getMediumTextStyle(
                            fontSize: 16,
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 5,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onAddToCart,
                child: Container(
                  padding: const EdgeInsets.all(AppConstants.smallSpacing),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBlue,
                    borderRadius:
                        BorderRadius.circular(AppConstants.smallRadius),
                  ),
                  child: const Icon(
                    CupertinoIcons.cart_badge_plus,
                    size: AppConstants.smallIconSize,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
