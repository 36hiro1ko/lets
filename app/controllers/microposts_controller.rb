class MicropostsController < ApplicationController
  #before_action :signed_in_user, only: [:create, :destroy]
  before_action :signed_in_user
  
  def index  
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'users/index'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
