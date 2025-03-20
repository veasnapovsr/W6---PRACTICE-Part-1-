import 'package:flutter/material.dart';
import '../models/course.dart';

const Color mainColor = Colors.blue;

class CourseScoreForm extends StatefulWidget {
  const CourseScoreForm({super.key});

  @override
  State<CourseScoreForm> createState() {
    return _CourseScoreFormState();
  }
}

class _CourseScoreFormState extends State<CourseScoreForm> {
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  String _enteredScore = '50'; // Fix: Initialize as a String

  void _saveItem() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      Navigator.of(
        context,
      ).pop(CourseScore(studentName: _enteredName, studentScore: double.parse(_enteredScore)));
    }
  }

  String? validateName(String? value) {
    if (value == null || value.trim().length < 1 || value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateScore(String? value) {
    final score = double.tryParse(value ?? '');
    if (score == null || score < 0 || score > 100) {
      return 'Must be between 0 and 100';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Add Score", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('Name')),
                validator: validateName,
                onSaved: (value) => _enteredName = value!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(label: Text('Score')),
                validator: validateScore,
                onSaved: (value) => _enteredScore = value!,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _saveItem,
                child: const Text("Add score"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
