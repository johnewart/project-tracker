class TaskController < ApplicationController
  def start
     task = Task.find(params[:id])
     timer = Timer.new
     timer.task = task
     timer.start_time = DateTime.now()
     timer.save
     render :text => "Timer for task #{task.name} started at #{timer.start_time}"
   end
   
   def new 
     @project = Project.find(params[:project_id])
     @task_categories = TaskCategory.find(:all)
   end 
   
   def create
     task = Task.new(params[:task])
     
     if task.save
        flash['notice'] = 'Task was successfully created.'
        redirect_to :controller => 'project', :action => 'show', :id => task.project_id
      else
        render_action 'new'
      end
   end
   
   def edit 
     @task = Task.find(params[:id])
     @task_categories = TaskCategory.find(:all)
   end
   
   def add_timer
	@task = Task.find(params[:id])	
	t = Time.new()
	timer = Timer.new()
	timer.task = @task
	timer.update_attributes(params[:timer])
	timer.save()
     	logger.info("Timer: " + timer.to_s)
     	render :nothing => true
   end
   
end
