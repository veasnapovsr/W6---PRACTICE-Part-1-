///working code, updaated Given sample code
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/courses_provider.dart';
import 'course_screen.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final coursesProvider = Provider.of<CoursesProvider>(context);
    final courses = coursesProvider.courses;

    return Scaffold(
      appBar: AppBar(title: const Text('Score App')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: Key(courses[index].name),
          background: Container(color: Colors.red), // Required for Dismissible
          child: CourseTile(
            course: courses[index],
            onEdit: (Course course) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CourseScreen(course: course),
              ));
            },
          ),
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final Course course;
  final Function(Course) onEdit;

  const CourseTile({super.key, required this.course, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(course.name),
      subtitle: Text(course.hasScore ? "Average: ${course.average}" : "No scores"),
      onTap: () => onEdit(course),
    );
  }
}
