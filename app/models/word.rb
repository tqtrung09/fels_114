class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}

  mount_uploader :sound, SoundUploader

  validates :content, presence: true, length: {maximum: 50}

  QUERRY_WORD_LEARNDED = "id in (select lesson_words.word_id from
    lesson_words join lessons on lesson_words.lesson_id = lessons.id
    where lessons.user_id = ?)"

  QUERRY_WORD_NOT_LEARNDED = "id not in (select lesson_words.word_id from
    lesson_words join lessons on lesson_words.lesson_id = lessons.id
    where lessons.user_id = ?)"

  scope :all_words, -> user_id{}
  scope :learned, -> user_id{where QUERRY_WORD_LEARNDED, user_id}
  scope :not_learned, -> user_id{where QUERRY_WORD_NOT_LEARNDED, user_id}
end
