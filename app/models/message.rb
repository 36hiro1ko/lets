class Message < ActiveRecord::Base
  #belongs_to :users
  #belongs_to :user_id, class_name: "User",foreign_key: "user_id"
  #belongs_to :destination, class_name: "User",foreign_key: "destination"
  
  #belongs_to :users

  belongs_to :user, class_name: "User"
  belongs_to :post_to, class_name: "User"
  
  
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :message, presence: true,length: { maximum: 500 }
  validates :post_to_id, presence: true
  

end
