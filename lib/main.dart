import 'package:flutter/material.dart';
import 'screens/plan_manager_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: PlanManagerScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    ),
  );
}
