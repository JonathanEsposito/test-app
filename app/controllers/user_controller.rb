class UserController < ApplicationController

  def add_user
    @user = User.new(params[:user])
    if request.post?
      @user.save
      redirect_to :action => :show_users
    end
  end

  def show_users
    @users = User.find :all, :order => "birth_date"
  end

end
