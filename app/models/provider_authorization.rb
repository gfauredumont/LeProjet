class ProviderAuthorization < ApplicationRecord
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  belongs_to :user
end
