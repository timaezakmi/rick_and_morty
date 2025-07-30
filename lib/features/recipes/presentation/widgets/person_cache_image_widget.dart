import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonCacheImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  const PersonCacheImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.border,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => _buildImage(imageProvider),
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => _buildErrorImage(),
    );
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        borderRadius:
            borderRadius ??
            BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.grey[300],
      ),
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildErrorImage() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: const DecorationImage(
          image: AssetImage('assets/images/noimage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
