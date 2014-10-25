class MessagesController < ApplicationController
  
  #メッセージ一覧
  def index
   
  end
  
  #メッセージを送る
  def send_message
    #@messages = Message.where("user_id=?",current_user.id).preload(:post_to_id)  
    @messages = current_user.messages if signed_in? 
  end
  
  def create
    
  end
end
