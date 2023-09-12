class CustomImage {
  /// [imagePath] Assign path to image
  String imagePath;

  /// [package] If you want to access it from a different module, pass the package value.
  // not required
  String? package;

  CustomImage(this.imagePath, {this.package});
}
