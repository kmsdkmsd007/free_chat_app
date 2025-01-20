import 'package:chat_app/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtmZGtzeGRlYXRodHF2bGpodWx4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3NTA0MzgsImV4cCI6MjA1MjMyNjQzOH0.85vHOAhdARopt1RdZyg8AHzNY12vcBZoj1l20d722mQ',
    url: 'https://kfdksxdeathtqvljhulx.supabase.co',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WellcomeScreen(),
    );
  }
}
