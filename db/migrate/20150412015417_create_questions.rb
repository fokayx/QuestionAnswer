class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.boolean :is_online

      t.timestamps null: false
    end
  end
end
