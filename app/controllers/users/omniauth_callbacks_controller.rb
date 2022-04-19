class Users::OmniauthCallbacksController < ApplicationController

  def twitter
    callback_from :twitter
  end

  def failure
    redirect_to root_path
  end

  private

  # コールバック時に行う処理
  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_omniauth(request.env['omniauth.auth'])

    if @user
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      @user = User.new()
      render 'devise/registrations/after_omniauth_signup'
    end
  end
end
