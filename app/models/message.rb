class Message < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :message, presence: true,length: { maximum: 500 }
  validates :destination, presence: true
end
