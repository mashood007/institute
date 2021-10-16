Build an application for an institute. The institute offers courses in different categories. The students will be registered and can be enrolled in multiple classes. After the completion of the course the student will appear in the exam and will be given a certificate once he/she passes the exam. 

Todo

Admin login
Courses CRUD
Students CRUD
  In the list, show the number of exams appeared, passed and failed. 
  Exams, questions, answers and results can be entered directly in the database. UI not required for this. 
Exam result
  Total student appeared, pass and failed
Question
Count of used in exam, correct answer, incorrect answer

database

Category ==
  name
  has_many courses

Course ==
  name
  belongs_to category
  has_many_and_belongs_to :students
  belongs_to exam optional ====> need to restructure
  #######passmark

student ==
  name
  rollnumber
  has_many :cources, through: student_courses 

StudentCourse ==
  student_id
  course_id
  //exam_id
  exam_result: not_attented/passed/failed => enum

Exam ==
  QuestionAnswer
  course_id

QuestionAnswer ==
  question text
  answer int
  options array
  point

AnswerSheet ==
  student_course_id
  answer
  correct_answer
  