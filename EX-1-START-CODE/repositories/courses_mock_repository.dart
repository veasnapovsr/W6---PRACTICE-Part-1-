///working code, new added
import '../models/course.dart';
import 'courses_repository.dart';

class MockCoursesRepository implements CoursesRepository {
  final List<Course> _courses = [
    Course(name: 'HTML'),
    Course(name: 'JAVA'),
  ];

  @override
  List<Course> getCourses() => _courses;

  @override
  void addScore(String courseId, CourseScore score) {
    var course = _courses.firstWhere((c) => c.name == courseId, orElse: () => Course(name: courseId));
    course.addScore(score);
  }
}
