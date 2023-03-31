class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # 公開・非公開機能
  scope :published, -> {where(is_published_flag: true)}
  scope :unpublished, -> {where(is_published_flag: false)}

  validates :name, presence: true
  validates :oshi_name, presence: true
  validates :call, presence: true
  validates :job, presence: true
  validates :favorite_point, presence: true
  validates :is_published_flag, inclusion: { in: [true, false] }

  validates :name, length: { maximum:10 } 
  validates :oshi_name, length: { maximum:10 } 
  validates :call, length: { maximum:10 } 
  validates :job, length: { maximum:15 } 
  validates :favorite_point, length: { maximum:20 } 
end
