class Message < ActiveRecord::Base

  belongs_to :user, class_name: "User"
  belongs_to :post_to, class_name: "User"
  
  
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :message, presence: true,length: { maximum: 500 }
  validates :post_to_id, presence: true
  

end
