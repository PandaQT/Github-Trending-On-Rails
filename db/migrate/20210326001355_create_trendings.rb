class CreateTrendings < ActiveRecord::Migration[6.1]
  def change
    create_table :trendings do |t|
      t.string :language

      t.timestamps
    end
  end
end
