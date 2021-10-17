json.student do
  json.id @student.id
  json.name @student.name
  json.courses do
    json.array! @student.student_courses do |student_course|
      json.name student_course.course.name
      json.result student_course.status || 'Not appeared'
    end
  end
end
