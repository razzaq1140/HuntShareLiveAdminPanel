import 'dart:typed_data';

class EventModel {
  final String? imagePath; // For non-web (file path)
  final Uint8List? imageBytes; // For web (file bytes)
  final String price;

  EventModel({
    this.imagePath,
    this.imageBytes,
    required this.price,
  });
}