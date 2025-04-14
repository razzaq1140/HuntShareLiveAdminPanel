import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/common/constants/global_variables.dart';
import 'package:hunt_share_live_admin_panel/common/widgets/custom_textfield.dart';
import 'package:hunt_share_live_admin_panel/features/add_game/model/add_game_model.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class AddGamePage extends StatefulWidget {
  const AddGamePage({super.key});

  @override
  State<AddGamePage> createState() => _AddGamePageState();
}

class _AddGamePageState extends State<AddGamePage> {
  List<AddGameModel> addGame = [];
  Uint8List? _fileBytes;
  String? _filePath;
  String? _fileName;
  String? selectValue;
  List<String> items = ["JPEG", "PNG", "WebP"];
  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _fileName = result.files.first.name;
          if (kIsWeb) {
            _fileBytes = result.files.first.bytes;
          } else {
            _filePath = result.files.first.path;
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking file: $e');
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking file: $e')));
    }
  }

  void _addGift() {
    if ((kIsWeb ? _fileBytes == null : _filePath == null) || selectValue == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    setState(() {
      addGame.add(
        AddGameModel(
          imagePath: kIsWeb ? null : _filePath,
          imageBytes: kIsWeb ? _fileBytes : null,
        ),
      );
      // Reset form
      _filePath = null;
      _fileBytes = null;
      _fileName = null;
      selectValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Widget giftForm = Container(
      height: screenHeight * 0.5,
      width: screenWidth * 0.35,
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Create Game',
              style: textTheme(context).bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme(context).onSecondary,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme(context).outlineVariant,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8,
                  ),
                  child: Text(
                    _fileName ?? 'Choose File - No file chosen',
                    style: textTheme(context).labelLarge?.copyWith(
                      color: colorScheme(context).onSecondary,
                      fontSize: screenWidth * 0.013,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: DropdownButtonFormField(
                style: textTheme(context).labelLarge?.copyWith(),
                value: selectValue,
                items:
                    items.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: textTheme(context).labelLarge?.copyWith(),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectValue = value;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorScheme(context).outlineVariant),
                    borderRadius: BorderRadius.circular(15),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme(context).outlineVariant),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme(context).outlineVariant),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme(context).outlineVariant),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  hintText: 'Select Image Type',
                  hintStyle: textTheme(context).labelLarge?.copyWith()
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: _addGift,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorScheme(context).primary,
                ),
                child: Center(
                  child: Text(
                    'Create Now',
                    style: textTheme(context).bodySmall?.copyWith(
                      color: colorScheme(context).onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return ResponsiveLayout(
      mobileLayout: Scaffold(body: Column(children: [])),
      tabletLayout: Scaffold(body: Column(children: [])),
      desktopLayout: Scaffold(
        backgroundColor: colorScheme(context).outlineVariant,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SizedBox(height: 20), Center(child: giftForm)],
          ),
        ),
      ),
    );
  }
}
