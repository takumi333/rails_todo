class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 10 }
  validates :description, presence: true, length: { maximum: 30 }


end
