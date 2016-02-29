class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|answer| answer[:content].blank?}

  mount_uploader :sound, SoundUploader

  validates :content, presence: true, length: {maximum: 50}
end
