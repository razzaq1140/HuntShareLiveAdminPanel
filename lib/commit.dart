//import 'dart:typed_data'; // For handling bytes on web
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart' show kIsWeb; // To check if running on web
// import 'package:flutter/material.dart';
// import 'dart:io' show File; // For non-web platforms
// import 'package:hunt_share_live_admin_panel/common/constants/global_variables.dart';
// import 'package:hunt_share_live_admin_panel/common/widgets/custom_textfield.dart';
// import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';
//
// class Gift {
//   final String? imagePath; // For non-web (file path)
//   final Uint8List? imageBytes; // For web (file bytes)
//   final String price;
//   final String type;
//
//   Gift({
//     this.imagePath,
//     this.imageBytes,
//     required this.price,
//     required this.type,
//   });
// }
//
// class AddGiftPage extends StatefulWidget {
//   const AddGiftPage({super.key});
//
//   @override
//   State<AddGiftPage> createState() => _AddGiftPageState();
// }
//
// class _AddGiftPageState extends State<AddGiftPage> {
//   String? selectValue;
//   List<String> items = ["Classic", "Free", "Privilege", "Event"];
//   List<Gift> gifts = []; // List to store gift data
//   String? _filePath; // For non-web platforms
//   Uint8List? _fileBytes; // For web platforms
//   String? _fileName; // To store the file name for display
//   final TextEditingController _priceController = TextEditingController();
//
//   Future<void> _pickFile() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.image, // Restrict to images
//         allowMultiple: false,
//         withData: true, // Ensure bytes are available for web
//       );
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _fileName = result.files.first.name;
//           if (kIsWeb) {
//             _fileBytes = result.files.first.bytes; // Store bytes for web
//           } else {
//             _filePath = result.files.first.path; // Store path for non-web
//           }
//         });
//       }
//     } catch (e) {
//       print('Error picking file: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error picking file: $e')),
//       );
//     }
//   }
//
//   void _addGift() {
//     if ((kIsWeb ? _fileBytes == null : _filePath == null) ||
//         _priceController.text.isEmpty ||
//         selectValue == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }
//
//     setState(() {
//       gifts.add(Gift(
//         imagePath: kIsWeb ? null : _filePath,
//         imageBytes: kIsWeb ? _fileBytes : null,
//         price: '\$${_priceController.text}',
//         type: selectValue!,
//       ));
//       // Reset form
//       _filePath = null;
//       _fileBytes = null;
//       _fileName = null;
//       _priceController.clear();
//       selectValue = null;
//     });
//   }
//
//   void _deleteGift(int index) {
//     setState(() {
//       gifts.removeAt(index);
//     });
//   }
//
//   @override
//   void dispose() {
//     _priceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     Widget giftForm = Container(
//       height: screenHeight * 0.5,
//       width: screenWidth * 0.35,
//       decoration: BoxDecoration(
//         color: colorScheme(context).onPrimary,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Text(
//               'Create Gift',
//               style: textTheme(context).bodySmall?.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: colorScheme(context).onSecondary),
//             ),
//             SizedBox(height: 10),
//             GestureDetector(
//               onTap: _pickFile,
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: colorScheme(context).outlineVariant),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
//                   child: Text(
//                     _fileName ?? 'Choose File - No file chosen',
//                     style: textTheme(context).labelLarge?.copyWith(
//                         color: colorScheme(context).onSecondary,
//                         fontSize: screenWidth * 0.013),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             CustomTextFormField(
//               controller: _priceController,
//               hint: 'Please Enter Price',
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               items: items.map((value) {
//                 return DropdownMenuItem(
//                   value: value,
//                   child: Text(
//                     value,
//                     style: textTheme(context).labelLarge?.copyWith(),
//                   ),
//                 );
//               }).toList(),
//               value: selectValue,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 12,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(color: colorScheme(context).outlineVariant),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(color: colorScheme(context).outlineVariant),
//                 ),
//                 errorBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(color: colorScheme(context).outlineVariant),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   selectValue = value;
//                 });
//               },
//               hint: Text(
//                 'Select value',
//                 style: textTheme(context).labelLarge?.copyWith(),
//               ),
//             ),
//             SizedBox(height: 15),
//             GestureDetector(
//               onTap: _addGift,
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: colorScheme(context).primary,
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Create Now',
//                     style: textTheme(context).bodySmall?.copyWith(
//                         color: colorScheme(context).onPrimary),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//     Widget giftTable = gifts.isEmpty
//         ? SizedBox.shrink()
//         : Container(
//       margin: EdgeInsets.symmetric(vertical: 20),
//       width: screenWidth * 0.35,
//       child: Table(
//         border: TableBorder.all(color: Colors.grey),
//         columnWidths: {
//           0: FlexColumnWidth(1),
//           1: FlexColumnWidth(1),
//           2: FlexColumnWidth(1),
//           3: FlexColumnWidth(1),
//         },
//         children: [
//           TableRow(
//             decoration: BoxDecoration(color: Colors.grey[200]),
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Image', textAlign: TextAlign.center),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Price', textAlign: TextAlign.center),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Type', textAlign: TextAlign.center),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Action', textAlign: TextAlign.center),
//               ),
//             ],
//           ),
//           ...gifts.asMap().entries.map((entry) {
//             int index = entry.key;
//             Gift gift = entry.value;
//             return TableRow(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: kIsWeb
//                       ? (gift.imageBytes != null
//                       ? Image.memory(
//                     gift.imageBytes!,
//                     height: 50,
//                     width: 50,
//                     fit: BoxFit.cover,
//                   )
//                       : Text('No Image', textAlign: TextAlign.center))
//                       : (gift.imagePath != null
//                       ? Image.file(
//                     File(gift.imagePath!),
//                     height: 50,
//                     width: 50,
//                     fit: BoxFit.cover,
//                   )
//                       : Text('No Image', textAlign: TextAlign.center)),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(gift.price, textAlign: TextAlign.center),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(gift.type, textAlign: TextAlign.center),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: ElevatedButton(
//                     onPressed: () => _deleteGift(index),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                     ),
//                     child: Text('Delete'),
//                   ),
//                 ),
//               ],
//             );
//           }).toList(),
//         ],
//       ),
//     );
//
//     return ResponsiveLayout(
//       mobileLayout: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               giftForm,
//               giftTable,
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//       tabletLayout: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               giftForm,
//               giftTable,
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//       desktopLayout: Scaffold(
//         backgroundColor: colorScheme(context).outlineVariant,
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 20),
//               Center(child: giftForm),
//               giftTable,
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }