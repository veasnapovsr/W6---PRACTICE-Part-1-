///working code
import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/courses_repository.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesRepository repository;
  List<Course> _courses = [];

  CoursesProvider(this.repository) {
    _loadCourses();
  }

  void _loadCourses() {
    _courses = repository.getCourses();
    notifyListeners();
  }

  List<Course> get courses => _courses;

  Course? getCourseFor(String courseId) {
    try {
      return _courses.firstWhere((c) => c.name == courseId);
    } catch (e) {
      return null; // Handle course not found
    }
  }

  void addScore(String courseId, CourseScore score) {
    repository.addScore(courseId, score);
    _loadCourses(); // Refresh courses
  }
}
