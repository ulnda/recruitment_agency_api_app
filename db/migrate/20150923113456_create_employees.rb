class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :contact_info, null: false
      t.boolean :job_search, null: false, default: false
      t.integer :salary, null: false

      t.timestamps
    end
  end
end
