import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/common/constants/global_variables.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class GiftTypesPage extends StatefulWidget {
  const GiftTypesPage({super.key});

  @override
  State<GiftTypesPage> createState() => _GiftTypesPageState();
}

class _GiftTypesPageState extends State<GiftTypesPage> {
  String? selectValue;
  List<String> items = ["Classic", "Free", "Privilege", "Event"];
  List<String> addGiftType = [];
  TextEditingController updateController = TextEditingController();

  @override
  void dispose() {
    updateController.dispose();
    super.dispose();
  }

  void _showUpdateDialog(String oldType) {
    updateController.text = oldType;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Gift Type'),
        content: TextField(
          controller: updateController,
          decoration: const InputDecoration(hintText: "Enter new gift type"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (updateController.text.isNotEmpty &&
                  !addGiftType.contains(updateController.text)) {
                setState(() {
                  int index = addGiftType.indexOf(oldType);
                  addGiftType[index] = updateController.text;
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ResponsiveLayout(
      mobileLayout: Scaffold(body: Column(children: [])),
      tabletLayout: Scaffold(body: Column(children: [])),
      desktopLayout: Scaffold(
        backgroundColor: colorScheme(context).outlineVariant,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: colorScheme(context).onPrimary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'Select Gift Type',
                        style: textTheme(context).bodySmall?.copyWith(
                          color: colorScheme(context).onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: DropdownButtonFormField(
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: textTheme(context).bodySmall?.copyWith(),
                                  ),
                                );
                              }).toList(),
                              value: selectValue,
                              onChanged: (value) {
                                setState(() {
                                  selectValue = value;
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              hint: Text(
                                'Select Type',
                                style: textTheme(context).bodySmall?.copyWith(),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (selectValue != null &&
                                  !addGiftType.contains(selectValue)) {
                                setState(() {
                                  addGiftType.add(selectValue!);
                                  selectValue = null; // Reset dropdown
                                });
                              } else if (selectValue == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Please select a gift type')),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Gift type already exists')),
                                );
                              }
                            },
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: colorScheme(context).primary,
                                borderRadius: BorderRadius.circular(8),
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
                          Container(
                            height: 40,
                            width: screenWidth * 0.3,
                            decoration: BoxDecoration(
                              color: colorScheme(context).primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'New Store',
                                style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme(context).onSecondary),
                        ),
                        child: DataTable(
                          columnSpacing: 100,
                          headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade200,
                          ),
                          columns: [
                            DataColumn(
                              label: Text(
                                'Gift Type',
                                style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Action',
                                style: textTheme(context).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          rows: addGiftType.map((type) {
                            return DataRow(
                              cells: [
                                DataCell(Text(type)),
                                DataCell(
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: colorScheme(context).error,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            addGiftType.remove(type);
                                          });
                                        },
                                        child: Text(
                                          'Delete',
                                          style: textTheme(context).bodySmall?.copyWith(
                                            color: colorScheme(context).onPrimary,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () => _showUpdateDialog(type),
                                        child: Text(
                                          'Update',
                                          style: textTheme(context).bodySmall?.copyWith(
                                            color: colorScheme(context).onPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}