class CreateCodeSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :code_snippets do |t|
      t.text :code
      t.references :language
      t.timestamps
    end
  end
end
