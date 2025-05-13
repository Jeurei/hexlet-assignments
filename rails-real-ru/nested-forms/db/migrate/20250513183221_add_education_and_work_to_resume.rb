class AddEducationAndWorkToResume < ActiveRecord::Migration[7.2]
  def change
    remove_reference :resumes, :resume_works, foreign_key: true, null: false
    remove_reference :resumes, :resume_education, foreign_key: true, null: false
  end
end
