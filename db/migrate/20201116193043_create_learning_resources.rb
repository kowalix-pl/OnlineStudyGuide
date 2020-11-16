class CreateLearningResources < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_resources do |t|
      t.text :reference 
      t.boolean :accessed
      t.references :language

      t.timestamps
    end
  end
end
