class StaticPagesController < ApplicationController
  
   #before_filter :current_user!, :except => [:contact] 
   layout :layout_by_current_user

  def home
    #もしログイン中であればユーザートップページを表示する
    if current_user
      redirect_to users_path
    end
  end

  def help
  end
  
  def about   
  end
  
  def sample   
  end
  
  def contact
  end
  
end
