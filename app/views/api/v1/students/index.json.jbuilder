json.array! @students do |student|
  json.id student.id
  json.name student.name
  json.total_courses student.student_courses.size
  json.total_passed student.passed_students.size
  json.total_failed student.failed_students.size
end
