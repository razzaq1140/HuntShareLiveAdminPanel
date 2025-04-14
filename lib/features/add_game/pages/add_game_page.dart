import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';
import 'package:intl/intl.dart';

class AddGamePage extends StatefulWidget {
  const AddGamePage({super.key});

  @override
  State<AddGamePage> createState() => _AddGamePageState();
}

class _AddGamePageState extends State<AddGamePage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  DateTime? selectedDate;
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        appBar: AppBar(title: Text("Add New Game")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // 📸 Banner Upload Placeholder
                GestureDetector(
                  onTap: () {
                    // image picker logic
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 16),

                // 🎮 Game Title
                TextFormField(
                  decoration: InputDecoration(labelText: "Game Title"),
                  validator: (val) => val!.isEmpty ? "Enter game title" : null,
                ),

                // 🏷️ Category Dropdown
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: ["Action", "Puzzle", "Adventure", "Arcade"]
                      .map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCategory = val),
                  decoration: InputDecoration(labelText: "Category"),
                ),

                // 📅 Release Date Picker
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: selectedDate == null
                        ? "Select Release Date"
                        : DateFormat.yMMMd().format(selectedDate!),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() => selectedDate = picked);
                    }
                  },
                ),

                // 📄 Description
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: "Game Description"),
                ),

                // 🔗 APK/URL Field
                TextFormField(
                  decoration: InputDecoration(labelText: "Game APK / URL"),
                ),

                // ✅ Status Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Game Status: ${isActive ? "Active" : "Inactive"}"),
                    Switch(
                      value: isActive,
                      onChanged: (val) => setState(() => isActive = val),
                    ),
                  ],
                ),

                // 🔘 Submit Button
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("Add Game"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // submit logic
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      tabletLayout: Scaffold(
        appBar: AppBar(title: Text("Add New Game")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // 📸 Banner Upload Placeholder
                GestureDetector(
                  onTap: () {
                    // image picker logic
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 16),

                // 🎮 Game Title
                TextFormField(
                  decoration: InputDecoration(labelText: "Game Title"),
                  validator: (val) => val!.isEmpty ? "Enter game title" : null,
                ),

                // 🏷️ Category Dropdown
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: ["Action", "Puzzle", "Adventure", "Arcade"]
                      .map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCategory = val),
                  decoration: InputDecoration(labelText: "Category"),
                ),

                // 📅 Release Date Picker
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: selectedDate == null
                        ? "Select Release Date"
                        : DateFormat.yMMMd().format(selectedDate!),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() => selectedDate = picked);
                    }
                  },
                ),

                // 📄 Description
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: "Game Description"),
                ),

                // 🔗 APK/URL Field
                TextFormField(
                  decoration: InputDecoration(labelText: "Game APK / URL"),
                ),

                // ✅ Status Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Game Status: ${isActive ? "Active" : "Inactive"}"),
                    Switch(
                      value: isActive,
                      onChanged: (val) => setState(() => isActive = val),
                    ),
                  ],
                ),

                // 🔘 Submit Button
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("Add Game"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // submit logic
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      desktopLayout: Scaffold(
        appBar: AppBar(title: Text("Add New Game")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // 📸 Banner Upload Placeholder
                GestureDetector(
                  onTap: () {
                    // image picker logic
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 16),

                // 🎮 Game Title
                TextFormField(
                  decoration: InputDecoration(labelText: "Game Title"),
                  validator: (val) => val!.isEmpty ? "Enter game title" : null,
                ),

                // 🏷️ Category Dropdown
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: ["Action", "Puzzle", "Adventure", "Arcade"]
                      .map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCategory = val),
                  decoration: InputDecoration(labelText: "Category"),
                ),

                // 📅 Release Date Picker
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: selectedDate == null
                        ? "Select Release Date"
                        : DateFormat.yMMMd().format(selectedDate!),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    );
                    if (picked != null) {
                      setState(() => selectedDate = picked);
                    }
                  },
                ),

                // 📄 Description
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: "Game Description"),
                ),

                // 🔗 APK/URL Field
                TextFormField(
                  decoration: InputDecoration(labelText: "Game APK / URL"),
                ),

                // ✅ Status Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Game Status: ${isActive ? "Active" : "Inactive"}"),
                    Switch(
                      value: isActive,
                      onChanged: (val) => setState(() => isActive = val),
                    ),
                  ],
                ),

                // 🔘 Submit Button
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("Add Game"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // submit logic
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
