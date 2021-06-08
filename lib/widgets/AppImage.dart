import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String image;

  const AppImage(
    this.image, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: 180,
          width: 180,
          child: Center(
            child: CupertinoActivityIndicator(),
          )),
      errorWidget: (context, url, error) => Container(
          height: 180,
          width: 180,
          child: Center(
            child: Text('Oh Snap!'),
          )),
    );
  }
}

class AppThumbImage extends StatelessWidget {
  final String image;
  final double size;

  const AppThumbImage(
    this.image, {
    Key? key,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: size,
          width: size,
          child: Center(
            child: CupertinoActivityIndicator(),
          )),
      errorWidget: (context, url, error) => Container(
        height: size,
        width: size,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xFFC4C4C4)),
      ),
    );
  }
}
