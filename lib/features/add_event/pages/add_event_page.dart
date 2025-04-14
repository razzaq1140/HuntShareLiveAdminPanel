import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(title: Text("Admin Panel - Add Event")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ongoing Event",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 16),
              // Horizontal list of event cards
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    EventCard(
                      title: "National Seminar",
                      date: "16 Dec 2019",
                      percent: 80,
                      color: Colors.purple,
                      members: 32,
                    ),
                    EventCard(
                      title: "Podcast Workshop",
                      date: "24 Dec 2019",
                      percent: 58,
                      color: Colors.orange,
                      members: 24,
                    ),
                    EventCard(
                      title: "Creator Meetup",
                      date: "4 Jan 2019",
                      percent: 32,
                      color: Colors.red,
                      members: 18,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text("Meeting",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 12),
              MeetingTile(
                title: "Workshop Meeting",
                date: "9 December 2019",
                members: 20,
                location: "Versus Coffee",
              ),
              MeetingTile(
                title: "Weekly Meeting",
                date: "14 December 2019",
                members: 42,
                location: "Starbuck",
              ),
              MeetingTile(
                title: "Group Photo",
                date: "22 December 2019",
                members: 28,
                location: "Berczy Park",
              ),
            ],
          ),
        ),
      ),
      tabletLayout: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(title: Text("Admin Panel - Add Event")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ongoing Event",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 16),
              // Horizontal list of event cards
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    EventCard(
                      title: "National Seminar",
                      date: "16 Dec 2019",
                      percent: 80,
                      color: Colors.purple,
                      members: 32,
                    ),
                    EventCard(
                      title: "Podcast Workshop",
                      date: "24 Dec 2019",
                      percent: 58,
                      color: Colors.orange,
                      members: 24,
                    ),
                    EventCard(
                      title: "Creator Meetup",
                      date: "4 Jan 2019",
                      percent: 32,
                      color: Colors.red,
                      members: 18,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text("Meeting",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 12),
              MeetingTile(
                title: "Workshop Meeting",
                date: "9 December 2019",
                members: 20,
                location: "Versus Coffee",
              ),
              MeetingTile(
                title: "Weekly Meeting",
                date: "14 December 2019",
                members: 42,
                location: "Starbuck",
              ),
              MeetingTile(
                title: "Group Photo",
                date: "22 December 2019",
                members: 28,
                location: "Berczy Park",
              ),
            ],
          ),
        ),
      ),
      desktopLayout: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(title: Text("Admin Panel - Add Event")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ongoing Event",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 16),
              // Horizontal list of event cards
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    EventCard(
                      title: "National Seminar",
                      date: "16 Dec 2019",
                      percent: 80,
                      color: Colors.purple,
                      members: 32,
                    ),
                    EventCard(
                      title: "Podcast Workshop",
                      date: "24 Dec 2019",
                      percent: 58,
                      color: Colors.orange,
                      members: 24,
                    ),
                    EventCard(
                      title: "Creator Meetup",
                      date: "4 Jan 2019",
                      percent: 32,
                      color: Colors.red,
                      members: 18,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text("Meeting",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 12),
              MeetingTile(
                title: "Workshop Meeting",
                date: "9 December 2019",
                members: 20,
                location: "Versus Coffee",
              ),
              MeetingTile(
                title: "Weekly Meeting",
                date: "14 December 2019",
                members: 42,
                location: "Starbuck",
              ),
              MeetingTile(
                title: "Group Photo",
                date: "22 December 2019",
                members: 28,
                location: "Berczy Park",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////// Event Card
class EventCard extends StatelessWidget {
  final String title, date;
  final int percent, members;
  final Color color;

  const EventCard({
    required this.title,
    required this.date,
    required this.percent,
    required this.color,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$percent%",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
          Spacer(),
          Row(
            children: [
              CircleAvatar(radius: 10, backgroundColor: color),
              SizedBox(width: 4),
              Text("$members Member", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

////// meetingTile
class MeetingTile extends StatelessWidget {
  final String title, date, location;
  final int members;

  const MeetingTile({
    required this.title,
    required this.date,
    required this.members,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.calendar_today, color: Colors.red),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Members: $members"),
            Text(date),
          ],
        ),
        trailing: Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
