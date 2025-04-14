import 'dart:typed_data';

class Gift {
  final String? imagePath; // For non-web (file path)
  final Uint8List? imageBytes; // For web (file bytes)
  final String price;
  final String type;

  Gift({
    this.imagePath,
    this.imageBytes,
    required this.price,
    required this.type,
  });
}