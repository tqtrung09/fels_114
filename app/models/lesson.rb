class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :lesson_words, dependent: :destroy
  has_many :words, through: :lesson_words

  accepts_nested_attributes_for :lesson_words
  before_create :create_lessonword
  after_create :create_activity

  private
  def create_lessonword
    self.words = self.category.words.order("RANDOM()").
      limit Settings.number_lesson_words
  end

  def create_activity
    Activity.create user_id: self.user.id, target_id: self.id, action_type: :learned
  end
end
