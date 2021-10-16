json.array! @students do |student|
  courses = student.student_courses
  json.id student.id
  json.name student.name
  json.total_courses courses.size
  json.total_passed courses.passed.size
  json.total_failed courses.failed.size
end