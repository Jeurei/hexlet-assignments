class MakeResumeReferencesNullable < ActiveRecord::Migration[7.2]
  def change
    # Remove the existing non-nullable foreign keys
    remove_reference :resumes, :resume_works, foreign_key: true, null: false
    remove_reference :resumes, :resume_education, foreign_key: true, null: false
    
    # Add them back as nullable
    add_reference :resumes, :resume_works, foreign_key: true, null: true
    add_reference :resumes, :resume_education, foreign_key: true, null: true
  end
end