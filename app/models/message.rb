class Message < ActiveRecord::Base
  belongs_to :user
  #belongs_to :user_id, class_name: "User"
  
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :message, presence: true,length: { maximum: 500 }
  validates :destination, presence: true
  

end
