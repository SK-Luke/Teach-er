class AddGradeToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :grade, :string, array: true, default: []
  end
end
