class Category < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 150}
end
