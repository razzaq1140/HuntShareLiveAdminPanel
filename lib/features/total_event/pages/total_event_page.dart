import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class TotalEventPage extends StatefulWidget {
  const TotalEventPage({super.key});

  @override
  State<TotalEventPage> createState() => _TotalEventPageState();
}

class _TotalEventPageState extends State<TotalEventPage> {
  final List<EventModel> events = [
    EventModel("National Seminar", "16 Dec 2019", 80, 32, "Ongoing",
        Colors.purple, "Islamabad"),
    EventModel("Podcast Workshop", "24 Dec 2019", 58, 24, "Ongoing",
        Colors.orange, "Lahore"),
    EventModel("Creator Meetup", "4 Jan 2019", 100, 18, "Completed", Colors.red,
        "Karachi"),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        appBar: AppBar(title: Text("Total Events")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔍 Optional Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search event...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              // 📋 Event List
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (_, index) {
                    final event = events[index];
                    return EventTileCard(event: event);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      tabletLayout: Scaffold(
        appBar: AppBar(title: Text("Total Events")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔍 Optional Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search event...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              // 📋 Event List
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (_, index) {
                    final event = events[index];
                    return EventTileCard(event: event);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      desktopLayout: Scaffold(
        appBar: AppBar(title: Text("Total Events")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔍 Optional Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search event...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              // 📋 Event List
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (_, index) {
                    final event = events[index];
                    return EventTileCard(event: event);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////EventModel

class EventModel {
  final String title;
  final String date;
  final int percent;
  final int members;
  final String status;
  final Color color;
  final String location;

  EventModel(this.title, this.date, this.percent, this.members, this.status,
      this.color, this.location);
}

////
class EventTileCard extends StatelessWidget {
  final EventModel event;

  const EventTileCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: event.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      event.status == "Completed" ? Colors.green : Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                    Text(event.status, style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Progress bar
          LinearProgressIndicator(
            value: event.percent / 100,
            color: event.color,
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: 8),
          // Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("📅 ${event.date}"),
              Text("📍 ${event.location}"),
            ],
          ),
          SizedBox(height: 8),
          // Members and Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 10, backgroundColor: event.color),
                  SizedBox(width: 4),
                  Text("${event.members} Members"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.edit, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Icon(Icons.delete, color: Colors.redAccent),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
