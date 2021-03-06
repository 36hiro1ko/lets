class UsersController < ApplicationController
  
  #layout 'users_layout'
  
  before_action :signed_in_user, only: [:index, :show, :edit, :update,:sent_messages, :received_messages ]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  layout :layout_by_current_user
  
  
  def index
    @users = User.paginate(page: params[:page])
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page]) if signed_in?
     render :layout => 'users_layout'
  end
  
  
  def allusers
     @users = User.paginate(page: params[:page])
     render :layout => 'users_layout'
  end

  def new
    @user = User.new
    render :layout => 'application'
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def sent_messages
    #送信メッセージ  
    @send_messages = Message.where("user_id=?",current_user.id).preload(:post_to).paginate(page: params[:page]) if signed_in?
   
    #User.find_by(id: msg.post_to_id).name
  end
  
  def received_messages
       #受信メッセージ
    @received_messages = Message.where("post_to_id = ?",current_user.id).preload(:post_to).paginate(page: params[:page]) if signed_in?
    #@read=@received_messages.where(read_flg: 0).count
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
    :password_confirmation)
  end

  # Before actions

=begin
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
=end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
