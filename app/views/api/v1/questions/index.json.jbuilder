json.array! @question_answers do |qa|
  json.id qa.id
  json.question qa.question
  json.options qa.options
  json.answer qa.options[qa.answer]
end