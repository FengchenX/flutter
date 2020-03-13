/**
 * 自定义图片缓存组件
 * Create by Songlcy
 */
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImageComponent extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;

  const CachedImageComponent(
      {@required this.imageUrl, this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: Key(imageUrl),
      fit: boxFit,
      errorWidget: (context, url, error) => new Icon(Icons.error),
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl: imageUrl.startsWith("http://")
          ? imageUrl.replaceFirst("http://", "https://")
          : imageUrl,
    );
  }
}
