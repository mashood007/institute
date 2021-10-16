require 'faker'

Admin.create!(username: 'admin', email: 'admin@demo.com', password: '123456')

#category
Category.create!(name: Faker::Name.name)

#Course
(1..5).each do |i|
  Course.create!(name: Faker::Name.name, category_id: 1)
end

#QuestionAnswer
(1..25).each do |i|
  question = Faker::Lorem.question(word_count: 4)
  options = Faker::Lorem.words(number: 4)
  answer = Faker::Number.within(range: 1..3)
  point = Faker::Number.within(range: 1..5)
  QuestionAnswer.create!(
    question: question, options: options, answer: answer, point: point
  )
end

#Exam
(1..3).each do |course|
  (1..6).each do |i|
    question_no = Faker::Number.within(range: 1..25)
    Exam.create(course_id: course, question_answer_id: question_no)
  end
end

#Students
status = StudentCourse.statuses.values
(1..25).each do |i|
  student = Student.create!(name: Faker::Name.name)
  course = Faker::Number.within(range: 1..5)
  c_status = status[Faker::Number.within(range: 1..3)]
  student.student_courses.create(course_id: course, status: c_status)
end

