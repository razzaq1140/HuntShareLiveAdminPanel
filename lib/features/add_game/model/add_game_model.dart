
import 'package:flutter/foundation.dart';

class AddGameModel{

  final String? imagePath; // For non-web (file path)
  final Uint8List? imageBytes; // For web (file bytes)

  AddGameModel({
  this.imagePath,
  this.imageBytes,
  });

}