class CreateSecretCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :secret_codes do |t|
      t.string :code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
