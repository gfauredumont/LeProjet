class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def any_provider_callback
    provider_data =  request.env['omniauth.auth']
    Rails.logger.debug provider_data.to_yaml

    unless @auth = ProviderAuthorization.find_by(provider: provider_data['provider'], uid: provider_data['uid'])
      logger.debug "No authentication available for this UID on #{provider_data['provider']}, looking for user by email if available"
      unless @user = User.find_by(email: provider_data['info']['email'])
        logger.debug "No user found for given email '#{provider_data['info']['email']}' from provider, creating new one"
        @user = User.create(email: provider_data['info']['email'])
      end
      @auth = ProviderAuthorization.create(provider: provider_data['provider'], uid: provider_data['uid'], user_id: @user.id)
      logger.debug "Created new ProviderAuthorization for user"
    end
    @user = @auth.user

    if @user.persisted?
      flash.notice = "Successfully signed-in (through #{provider_data['provider']}) !"
      sign_in_and_redirect @user
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_path
    end

    # render :text => request.env['omniauth.auth'].to_yaml
  end

  alias_method :facebook, :any_provider_callback
end
