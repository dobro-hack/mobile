enum ImageType {
  svg,
  raster,
  unknown,
}

abstract class ImageTypeDetector {
  static final List<String> _svgExtensions = ['.svg'];
  static final List<String> _rasterExtensions = [
    '.png',
    '.jpg',
    '.jpeg',
    '.bmp',
    '.gif',
    '.webp'
  ];

  static ImageType getImageType(String imageUrl) {
    final lowerCaseUrl = imageUrl.toLowerCase();

    if (_svgExtensions.any((ext) => lowerCaseUrl.endsWith(ext))) {
      return ImageType.svg;
    }

    if (_rasterExtensions.any((ext) => lowerCaseUrl.endsWith(ext))) {
      return ImageType.raster;
    }

    return ImageType.unknown;
  }

  static bool isSvg(String imageUrl) {
    return getImageType(imageUrl) == ImageType.svg;
  }

  static bool isRaster(String imageUrl) {
    return getImageType(imageUrl) == ImageType.raster;
  }
}
