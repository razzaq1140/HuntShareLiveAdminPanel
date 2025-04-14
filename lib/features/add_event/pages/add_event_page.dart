import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/common/constants/global_variables.dart';
import 'package:hunt_share_live_admin_panel/common/widgets/custom_textfield.dart';
import 'package:hunt_share_live_admin_panel/features/add_event/model/event_model.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart';


class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  List<EventModel> events = [];
  Uint8List? _fileBytes;
  String? _filePath;
  String? _fileName;
  final TextEditingController _eventController = TextEditingController();

  Future<void> _pickFile() async{
    try{
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        withData: true,
      );
      if(result != null && result.files.isNotEmpty){
        setState(() {
          _fileName = result.files.first.name;
          if(kIsWeb){
            _fileBytes = result.files.first.bytes;
          }else{
            _filePath = result.files.first.path;
          }
        });
      }
    }catch(e){
      if (kDebugMode) {
        print('Error picking file: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file: $e')),
      );
    }
  }
  void _addGift() {
    if ((kIsWeb ? _fileBytes == null : _filePath == null) ||
        _eventController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      events.add(EventModel(
        imagePath: kIsWeb ? null : _filePath,
        imageBytes: kIsWeb ? _fileBytes : null,
        price: _eventController.text,
      ));
      // Reset form
      _filePath = null;
      _fileBytes = null;
      _fileName = null;
      _eventController.clear();
    });
  }

  void _deleteGift(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _eventController.dispose();
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
              'Create Gift',
              style: textTheme(context).bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme(context).onSecondary),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme(context).outlineVariant),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Text(
                    _fileName ?? 'Choose File - No file chosen',
                    style: textTheme(context).labelLarge?.copyWith(
                        color: colorScheme(context).onSecondary,
                        fontSize: screenWidth * 0.013),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              controller: _eventController,
              hint: 'Please Enter Event Name',
              keyboardType: TextInputType.number,
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
                        color: colorScheme(context).onPrimary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Widget giftTable = events.isEmpty
        ? SizedBox.shrink()
        : Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: screenWidth,
      child: Table(
        border: TableBorder.all(color: Colors.grey),
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[200]),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Image', textAlign: TextAlign.center,style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Event Name', textAlign: TextAlign.center,style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Action', textAlign: TextAlign.center,style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          ...events.asMap().entries.map((entry) {
            int index = entry.key;
            EventModel gift = entry.value;
            return TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: kIsWeb
                      ? (gift.imageBytes != null
                      ? Image.memory(
                    gift.imageBytes!,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  )
                      : Text('No Image', textAlign: TextAlign.center))
                      : (gift.imagePath != null
                      ? Image.file(
                    File(gift.imagePath!),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  )
                      : Text('No Image', textAlign: TextAlign.center)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(gift.price, textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                  child: ElevatedButton(
                    onPressed: () => _deleteGift(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme(context).error,
                    ),
                    child: Text('Delete',style: textTheme(context).bodySmall?.copyWith(color: colorScheme(context).onPrimary),),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
    return ResponsiveLayout(
        mobileLayout: Scaffold(
          body: Column(
            children: [

            ],
          ),
        ),
        tabletLayout: Scaffold(
          body: Column(
            children: [

            ],
          ),
        ),
        desktopLayout: Scaffold(
          backgroundColor: colorScheme(context).outlineVariant,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(child: giftForm),
                giftTable,
                SizedBox(height: 20),
              ],
            ),
          ),
        )
    );
  }
}
