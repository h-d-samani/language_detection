class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :content
      t.string :language

      t.timestamps
    end
  end
end
