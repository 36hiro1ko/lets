class MessagesController < ApplicationController
  #メッセージ詳細
  def message_show
    @message = Message.find(params[:id])
  end
  
  
  def create
    
  end
  
  #送信メッセージ詳細
  def show
    @message = Message.find(params[:id]) 
    
  end
  
  #受信メッセージ詳細
  def received_message_detail
    @message = Message.find(params[:id]) 
    @message.update(read_flg: 1) #0:未読, 1:既読 
    render :json => @message
    

  end

  
end
