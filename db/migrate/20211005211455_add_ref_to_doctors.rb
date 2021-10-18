class AddRefToDoctors < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.references :doctors, foreign_key: { to_table: :users }
  
    end
  end
end
