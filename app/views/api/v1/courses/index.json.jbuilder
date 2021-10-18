json.set! :data do
  json.courses @courses do |course|
    students = course.student_courses
    json.id course.id
    json.name course.name
    json.category course.category.name
    json.created_at course.created_at
    json.total_students course.appeared_courses.size
    json.exam_passed course.passed_courses.size
    json.exam_failed course.failed_courses.size
  end

  json.categories @categories do |category|
    json.id category.id
    json.name category.name
  end

end