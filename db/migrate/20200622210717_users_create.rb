class UsersCreate < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      t.timestamps

      t.text(:name, null: false)
    end
  end
end
