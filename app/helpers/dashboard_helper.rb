module DashboardHelper

  #Gets count of overdue assignments
  def overdue_count(project)
    count = 0
    project.tasks.each do |task|
      overdue=!task.due_date.nil? && task.due_date.past? && !task.complete?
      if overdue
        count += 1
      end
    end
    count
  end
end
