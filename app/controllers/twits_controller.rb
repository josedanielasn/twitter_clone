class TwitsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_from_params, only: %i[ index create destroy ]
  before_action :twit_from_params, only: %i[ destroy retwit unretwit ]

  def create
    @twit = @user.twits.create(twit_params)
    redirect_to user_path(@user)
  end

  def destroy
    @twit = Twit.find(params[:id])
    @twit.destroy

    redirect_to user_path(@user)
  end

  def

  private
    def user_from_params
      @user = User.find(params[:user_id])
    end

    def twit_from_params
      @twit = Twit.find(params[:id])
    end

    def twit_params
      params.require(:twit).permit(:body)
    end
end
