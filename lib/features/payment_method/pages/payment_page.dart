import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Payment Method Management"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Left: Add Payment Method Form
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add Payment Method",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Method Name (e.g., JazzCash)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: detailsController,
                          decoration: InputDecoration(
                            labelText: 'Details (e.g., Account No)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add your save logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text("Add Method"),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Right: List of Payment Methods
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("All Payment Methods",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        PaymentMethodTile(
                            name: "JazzCash", detail: "0300-1234567"),
                        PaymentMethodTile(
                            name: "Easypaisa", detail: "0345-6543210"),
                        PaymentMethodTile(
                            name: "Bank Transfer",
                            detail: "Meezan, IBAN: PK00XXXX"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      tabletLayout: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Payment Method Management"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Left: Add Payment Method Form
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add Payment Method",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Method Name (e.g., JazzCash)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: detailsController,
                          decoration: InputDecoration(
                            labelText: 'Details (e.g., Account No)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add your save logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text("Add Method"),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Right: List of Payment Methods
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("All Payment Methods",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        PaymentMethodTile(
                            name: "JazzCash", detail: "0300-1234567"),
                        PaymentMethodTile(
                            name: "Easypaisa", detail: "0345-6543210"),
                        PaymentMethodTile(
                            name: "Bank Transfer",
                            detail: "Meezan, IBAN: PK00XXXX"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      desktopLayout: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Payment Method Management"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Left: Add Payment Method Form
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add Payment Method",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Method Name (e.g., JazzCash)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: detailsController,
                          decoration: InputDecoration(
                            labelText: 'Details (e.g., Account No)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add your save logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text("Add Method"),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Right: List of Payment Methods
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("All Payment Methods",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        PaymentMethodTile(
                            name: "JazzCash", detail: "0300-1234567"),
                        PaymentMethodTile(
                            name: "Easypaisa", detail: "0345-6543210"),
                        PaymentMethodTile(
                            name: "Bank Transfer",
                            detail: "Meezan, IBAN: PK00XXXX"),
                      ],
                    ),
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

////Payment MethodTile

class PaymentMethodTile extends StatelessWidget {
  final String name;
  final String detail;

  const PaymentMethodTile({required this.name, required this.detail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.payment, color: Colors.deepPurple),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(detail),
      trailing: Icon(Icons.edit, color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(vertical: 8),
    );
  }
}
