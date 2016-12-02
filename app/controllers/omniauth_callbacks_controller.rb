class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def any_provider_callback
    provider_data =  request.env['omniauth.auth']
    Rails.logger.debug provider_data.to_yaml

    unless @user = ProviderAuthorization.find_by(provider: provider_data['provider'], uid: provider_data['uid'])&.user
      @user = User.from_omniauth(provider_data)
      if @user.valid?
        @auth = ProviderAuthorization.create(provider: provider_data['provider'], uid: provider_data['uid'], user_id: @user.id)
      end
    end

    if @user.persisted?
      flash.notice = "Successfully signed-in (through #{provider_data['provider']}) !"
      sign_in_and_redirect @user
    else
      flash.alert = "We can't create an account without getting your email from #{provider_data['provider']}, please use the 'normal' way"
      # session['devise.user_attributes'] = @user.attributes
      redirect_to new_user_registration_path
    end

    # render :text => request.env['omniauth.auth'].to_yaml
  end

  alias_method :facebook, :any_provider_callback
  alias_method :github, :any_provider_callback
end
