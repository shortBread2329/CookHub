class Public::PremiumsController < ApplicationController
  before_action :authenticate_user!, except: [:payment]

  def payment
    if user_signed_in?
      render :payment
    else
      redirect_to new_user_session_path, alert: "無料会員登録の上、サブスクリプション加入手続きにお進みください。会員の方は、ログインをお願いいたします。"
    end
  end

  def update
    @user = current_user
    if @user.is_paid == false
      @user.update(is_paid: true)
      redirect_to premiums_complete_path
    else
      flash[:alert] = "お客様はすでにサブスクリプションに加入されています。"
      render :payment
    end
  end

  def complete
    if request.referer&.include?("/premiums")
      render :complete
    else
      redirect_to premium_path
    end
  end
end
