import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../constants/app_constants.dart';

class ImageDisplayWidget extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final double width;
  final double height;
  final double borderRadius;

  const ImageDisplayWidget({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.width = 120,
    this.height = 120,
    this.borderRadius = AppConstants.mediumRadius,
  }) : assert(imageUrl != null || assetPath != null,
            'Either imageUrl or assetPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl != null) {
      // Network image using CachedNetworkImage
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: CupertinoColors.systemGrey5,
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: CupertinoColors.systemGrey5,
          child: const Icon(
            CupertinoIcons.exclamationmark_triangle,
            color: CupertinoColors.systemRed,
            size: 30,
          ),
        ),
      );
    } else {
      // Asset image
      return Image.asset(
        assetPath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: CupertinoColors.systemGrey5,
          child: const Icon(
            CupertinoIcons.photo,
            color: CupertinoColors.systemGrey,
            size: 40,
          ),
        ),
      );
    }
  }
}
