class TestDb < ActiveRecord::Migration[5.0]
  def change
    create_table :testing do |t|
      t.string :name
    end
  end
end
