class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :specialities
      t.string :reg_no

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
