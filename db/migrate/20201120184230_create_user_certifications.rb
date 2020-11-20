class CreateUserCertifications < ActiveRecord::Migration[6.0]
  
  def change
    create_table :user_certifications do |t|
      t.integer :grade
      t.references :user
      t.references :certification

      t.timestamps
    end
  end
end
