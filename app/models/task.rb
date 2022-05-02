class Task < ApplicationRecord
  belongs_to :project

  after_save :update_percent_complete if :mark_complete?

  scope :completed -> { where(complete: true)}

  def mark_complete?
    self.complete == true
  end

  def update_percent_complete
    project = Project.find(self.project_id)
    count_of_completed_tasks = project.tasks.complete.count
    count_of_total_tasks = project.tasks.count
    project.update!(percent_complete: Counter.calculate_percent_complete(
      count_of_completed_tasks, count_of_total_tasks
    ))
  end

end
