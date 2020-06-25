class CreateActionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :action_plans do |t|
      t.belongs_to :care_journey
      t.string :title, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
