class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @twit = Twit.new()
    @user = User.find(params[:id])
    @all = TwitsService.get_twits_retwits(@user)
  end
end
