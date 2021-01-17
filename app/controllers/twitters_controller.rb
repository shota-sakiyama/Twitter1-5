class TwittersController < ApplicationController
  before_action :set_twitter, only: [:show, :edit, :update, :destroy]
  def index
    @twitters = Twitter.all
  end

  def new
    @twitter = Twitter.new
  end

  def create
    @twitter = Twitter.new(twitter_params)
    if params[:back]
      render :new
    else
      if @twitter.save
        redirect_to twitters_path, notice: "ツイートしました！"
      else
        render :new
      end
    end
  end

  def confirm
    @twitter = Twitter.new(twitter_params)
    render :new if @twitter.invalid?
  end

  def edit
  end

  def update
    if @twitter.update(twitter_params)
      redirect_to home_path, notice: "ツイートを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @twitter.destroy
    redirect_to twitters_path, notice:"ツイートを削除しました！"
  end


  private
  def twitter_params
    params.require(:twitter).permit(:content)
  end

  def set_twitter
    @twitter = Twitter.find(params[:id])
  end

end
