/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDumbsGen {
  const $AssetsDumbsGen();

  /// File path: assets/dumbs/dumb.json
  String get dumb => 'assets/dumbs/dumb.json';

  /// List of all assets
  List<String> get values => [dumb];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon.svg
  String get icon => 'assets/icons/icon.svg';

  /// List of all assets
  List<String> get values => [icon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image.png
  AssetGenImage get image => const AssetGenImage('assets/images/image.png');

  /// List of all assets
  List<AssetGenImage> get values => [image];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/fgi.png
  AssetGenImage get fgi => const AssetGenImage('assets/logo/fgi.png');

  /// File path: assets/logo/foreground_logo.png
  AssetGenImage get foregroundLogo =>
      const AssetGenImage('assets/logo/foreground_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [fgi, foregroundLogo];
}

class Assets {
  const Assets._();

  static const $AssetsDumbsGen dumbs = $AssetsDumbsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
