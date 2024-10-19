import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_therapist/features/Tasks/screens/TaskPage.dart';

class DropdownExample extends StatefulWidget {
  final String status;

  const DropdownExample({super.key, required this.status});
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  // Initial value for the dropdown
  @override
  Widget build(BuildContext context) {
    String selectedValue = widget.status;
    return DropdownButton<String>(
        value: selectedValue, // The current selected value
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: [
          DropdownMenuItem<String>(
            value: 'pending',
            child: Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  border: Border.all(color: Colors.blue)),
              child: Center(
                child: Text(
                  'pending',
                  style: GoogleFonts.urbanist(fontSize: 15),
                ),
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: 'in progress',
            child: Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.5),
                  border: Border.all(color: Colors.orange)),
              child: Center(
                child: Text(
                  'In Progress',
                  style: GoogleFonts.urbanist(fontSize: 15),
                ),
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: 'Done',
            child: Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  border: Border.all(color: Colors.green)),
              child: Center(
                child: Text(
                  'Done',
                  style: GoogleFonts.urbanist(fontSize: 15),
                ),
              ),
            ),
          ),
        ]);
  }
}
