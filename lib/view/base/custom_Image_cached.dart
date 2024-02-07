
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageCached extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool isRound;
  final String placeholder;

  CustomImageCached({
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.placeholder = 'assets/image/placeholder.png',
    this.isRound = true,
  });

  @override
  Widget build(BuildContext context) {
    log('Image Url Format: ${image ?? ""}');
    if (image.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        image,
        placeholderBuilder: (BuildContext context) => _buildPlaceholder(),
        height: height,
        width: width,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => _buildPlaceholder(),
        imageBuilder: (context, imageProvider) => _buildImageWidget(imageProvider),
        errorWidget: (c, o, s) => _buildErrorWidget(),
      );
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: isRound ? BorderRadius.all(Radius.circular(6)) : null,
        image: DecorationImage(
          image: AssetImage(placeholder),
          fit: fit,
        ),
      ),
    );
  }

  Widget _buildImageWidget(ImageProvider imageProvider) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: isRound ? BorderRadius.all(Radius.circular(6)) : null,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: isRound ? BorderRadius.all(Radius.circular(10)) : null,
        image: DecorationImage(
          image: AssetImage(placeholder),
          fit: fit,
        ),
      ),
    );
  }
}


// class CustomImageCached extends StatelessWidget {
//   final String image;
//   final double? height;
//   final double? width;
//   final BoxFit ?fit;
//   final bool isRound;
//   final String placeholder;
//   CustomImageCached({required this.image, this.height, this.width,
//     this.fit, this.placeholder='assets/image/placeholder.png',  this.isRound=true});
//
//   @override
//   Widget build(BuildContext context) {
//     print(image);
//     return CachedNetworkImage(
//       imageUrl:image,
//       placeholder: (context, url) =>Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           borderRadius:isRound? BorderRadius.all(Radius.circular(6)):null,
//           image: DecorationImage(
//             image: new AssetImage(placeholder),
//             fit: fit,
//
//           ),
//         ),
//       ),
//
//
//       imageBuilder: (context, imageProvider) => Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           borderRadius: isRound? BorderRadius.all(Radius.circular(6)):null,
//           image: DecorationImage(
//             image: imageProvider,
//             fit: fit,
//
//           ),
//         ),
//       ),
//       errorWidget: (c, o, s) => Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           borderRadius: isRound? BorderRadius.all(Radius.circular(10)):null,
//           image: DecorationImage(
//
//             image: new AssetImage(placeholder),
//             fit: fit,
//
//           ),
//         ),
//       ),
//     );
//   }
// }




/*

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageCached extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool isRound;
  final String placeholder;

  CustomImageCached({
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.placeholder = 'assets/image/placeholder.png',
    this.isRound = true,
  });

  @override
  Widget build(BuildContext context) {
    print(image);
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: isRound ? BorderRadius.all(Radius.circular(6)) : null,
          image: DecorationImage(
            image: AssetImage(placeholder),
            fit: fit,
          ),
        ),
      ),
      imageBuilder: (context, imageProvider) {
        if (image.endsWith('.svg')) {
          return Container(
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
          );
        } else {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: isRound ? BorderRadius.all(Radius.circular(6)) : null,
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          );
        }
      },
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: isRound ? BorderRadius.all(Radius.circular(10)) : null,
          image: DecorationImage(
            image: AssetImage(placeholder),
            fit: fit,
          ),
        ),
      ),
    );
  }
}*/
