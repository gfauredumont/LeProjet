class CreateProviderAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :provider_authorizations do |t|
      t.integer :user_id,         null: false
      t.string :provider,         null: false
      t.string :uid,              null: false

      t.timestamps
    end
  end
end
