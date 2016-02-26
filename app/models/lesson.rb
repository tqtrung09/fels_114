class Lesson < ActiveRecord::Base
  belong_to :user
  belong_to :category
  has_many :lesson_words, dependent: :destroy
end
