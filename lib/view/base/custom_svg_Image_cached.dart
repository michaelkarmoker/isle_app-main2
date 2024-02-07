import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageCachedSVG extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit ?fit;
  final bool isRound;
  final String placeholder;
  CustomImageCachedSVG({required this.image, this.height, this.width,
    this.fit, this.placeholder='assets/image/placeholder.png',  this.isRound=true});

  @override
  Widget build(BuildContext context) {
    print(image);
    return CachedNetworkImage(
      imageUrl:image,
      placeholder: (context, url) =>Container(
        height: height,
        width: width,
        child: SvgPicture.network(
          image,
          height: height,
          width: width,
          fit: fit!,
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),


      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: isRound? BorderRadius.all(Radius.circular(6)):null,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,

          ),
        ),
      ),
      errorWidget: (c, o, s) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: isRound? BorderRadius.all(Radius.circular(10)):null,
          image: DecorationImage(

            image: new AssetImage(placeholder),
            fit: fit,

          ),
        ),
      ),
    );
  }
}
