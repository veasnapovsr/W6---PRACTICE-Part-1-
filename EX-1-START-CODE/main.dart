import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/course_list_screen.dart';
import 'providers/courses_provider.dart';
import 'repositories/courses_mock_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CoursesProvider(MockCoursesRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseListScreen(),
    );
  }
}
