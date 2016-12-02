class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  has_many    :projects_users
  has_many    :projects, through: :projects_users

  has_many    :provider_authorization

  # Allows creation of User from session given informations (usefull for omniauth incomplete signup)
  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes']) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(omniauth_params)
    return User.new unless omniauth_params['info']['email']
    unless user = User.find_by(email: omniauth_params['info']['email'])
      user = User.create(email: omniauth_params['info']['email'], password: Devise.friendly_token[0,20])
    end
    user
  end

end
