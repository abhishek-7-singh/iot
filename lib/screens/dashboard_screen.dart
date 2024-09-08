import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'system_settings_screen.dart';
import 'notification_settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  // Dummy sensor data
  final double soilMoisture = 45.2; // in percentage
  final double temperature = 28.5;  // in Celsius
  final double humidity = 60.3;     // in percentage
  final double lightLevel = 350.0;  // in lux

  // State variables for dials
  double ledLightValue = 50.0;
  double speakerVolumeValue = 50.0;
  double waterSprayerIntensityValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Real-Time Monitoring Section
            const Text(
              'Real-Time Monitoring',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSensorData('Soil Moisture', soilMoisture.toString() + '%'),
            _buildSensorData('Temperature', temperature.toString() + '°C'),
            _buildSensorData('Humidity', humidity.toString() + '%'),
            _buildSensorData('Light Level', lightLevel.toString() + ' lux'),
            const SizedBox(height: 20),

            // Static Camera Feed Section
            const Text(
              'Camera Feed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('Camera Feed Placeholder')),
            ),
            const SizedBox(height: 20),

            // Control and Automation Section
            const Text(
              'Control and Automation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildControlDial('LED Light Control', ledLightValue, (value) {
              setState(() {
                ledLightValue = value;
              });
            }),
            _buildControlDial('Speaker Control', speakerVolumeValue, (value) {
              setState(() {
                speakerVolumeValue = value;
              });
            }),
            _buildControlDial('Water Sprayer Control', waterSprayerIntensityValue, (value) {
              setState(() {
                waterSprayerIntensityValue = value;
              });
            }),
            const SizedBox(height: 20),

            // Notifications and Alerts Section
            const Text(
              'Notifications and Alerts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildAlert('Animal Detection', 'Peacock detected at 3:00 PM'),
            _buildAlert('Environmental Alert', 'Low soil moisture detected'),
            const SizedBox(height: 20),

            // Data Visualization Section
            const Text(
              'Data Visualization',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildGraphPlaceholder('Temperature Over Time'),
            _buildGraphPlaceholder('Soil Moisture Over Time'),
            const SizedBox(height: 20),

            // Event Logs Section
            const Text(
              'Event Logs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildEventLog('Animal Detection: Peacock at 3:00 PM'),
            _buildEventLog('Irrigation Triggered at 4:00 PM'),
          ],
        ),
      ),
    );
  }

  // Helper Widget to build dials
  Widget _buildControlDial(String label, double value, ValueChanged<double> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Slider(
            value: value,
            min: 0,
            max: 100,
            divisions: 10,
            label: value.round().toString(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  // Helper Widget to display sensor data
  Widget _buildSensorData(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // Helper Widget to build alerts
  Widget _buildAlert(String title, String message) {
    return Card(
      color: Colors.orange[100],
      child: ListTile(
        title: Text(title),
        subtitle: Text(message),
        leading: const Icon(Icons.warning, color: Colors.orange),
      ),
    );
  }

  // Helper Widget to build graph placeholders
  Widget _buildGraphPlaceholder(String title) {
    return Card(
      color: Colors.blue[100],
      child: ListTile(
        title: Text(title),
        subtitle: const Text('Graph Placeholder'),
        leading: const Icon(Icons.show_chart, color: Colors.blue),
      ),
    );
  }

  // Helper Widget to build event logs
  Widget _buildEventLog(String event) {
    return ListTile(
      leading: const Icon(Icons.event),
      title: Text(event),
    );
  }

  // Build a Drawer for Profile, Settings, and Notifications
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Settings Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('System Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SystemSettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
