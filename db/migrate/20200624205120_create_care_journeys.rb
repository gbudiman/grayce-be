class CreateCareJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :care_journeys do |t|
      t.belongs_to :user

      t.text :care_situation, null: true
      t.text :goals, null: true
      t.integer :stage, null: false, default: 0

      t.timestamps
    end
  end
end
