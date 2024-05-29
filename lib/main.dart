import 'package:flutter/material.dart';
import 'package:schedule_notification/notifation_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scheduled notifiation"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificationHelper.scheduledNotification(
                'scheduled', 'this is scheduled notifiaio');
          },
          child: const Text("Scheduled Now"),
        ),
      ),
    );
  }
}