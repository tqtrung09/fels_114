class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer

  QUERRY_TRUE_ANSWERS = "answer_id in
    (select answers.id from answers where answers.correct = 't')"

  scope :true_answers, -> {where QUERRY_TRUE_ANSWERS}
end
