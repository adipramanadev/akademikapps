import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akademi Apps"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Akademi Apps!",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
