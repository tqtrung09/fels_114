class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words

  accepts_nested_attributes_for :lesson_words
  before_create :create_lessonword

  private
  def create_lessonword
    self.words = self.category.words.order("RANDOM()").
      limit Settings.number_lesson_words
  end
end
