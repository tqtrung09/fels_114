class Activity < ActiveRecord::Base
  belongs_to :user

  validates :target_id, presence: true
  validates :user, presence: true

  QUERRY_ACTIVITIES = "user_id in (select followed_id from
    relationships where follower_id = ?) or user_id = ?"

  scope :activities, ->user_id do
   where(QUERRY_ACTIVITIES, user_id, user_id)
    .order created_at: :desc
  end

  def load_lesson
    Lesson.find_by id: self.target_id
  end
end
