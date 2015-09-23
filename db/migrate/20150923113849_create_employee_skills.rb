class CreateEmployeeSkills < ActiveRecord::Migration
  def change
    create_table :employee_skills do |t|
      t.references :employee, index: true
      t.references :skill, index: true

      t.timestamps
    end

    add_index "employee_skills", ["employee_id", "skill_id"], name: "index_employee_skills_on_employee_and_skill", unique: true
  end
end
