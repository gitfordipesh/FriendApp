class AddSubmissionDateToUserProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :user_projects, :submission_date, :date
  end
end
