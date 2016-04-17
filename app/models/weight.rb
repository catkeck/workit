class Weight < ActiveRecord::Base
  belongs_to :user
  validates :user_id,  presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :date, presence: true


end
