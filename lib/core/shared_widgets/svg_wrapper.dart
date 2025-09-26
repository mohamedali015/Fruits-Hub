import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWrapper extends StatelessWidget {
  const SvgWrapper({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.scaleDown,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit!,
      width: width,
      height: height,
    );
  }
}
