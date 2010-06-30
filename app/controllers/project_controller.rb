class ProjectController < ApplicationController
  def index
    list
    render_action 'list'
  end
  
  def dashboard 
    @openprojects = Project.find(:all, :conditions => "started IS NOT NULL AND completed IS NULL")
    @opentasks = Task.find(:all, :conditions => "completed_date IS NULL", :order => "due_date ASC")
    @activetimers = Timer.find(:all, :conditions => 'stop_time IS NULL');
    @openinvoices = Invoice.find(:all, :conditions => "state = 'U'");
  end
  
  def edit
    @project = Project.find(params[:id])
    @customers = Customer.find(:all)
  end
  
  def list
    @projects = Project.find(:all)
    @customers = Customer.find(:all) 
  end
  
  def show 
    @project = Project.find(params[:id])
  end

  def add_invoice
    @invoice = Invoice.new
    @invoice.project = Project.find(params[:project])
    @invoice.save
    render :partial => 'an_invoice', :object => @invoice
  end
  
  def new
    @customers = Customer.find(:all)
  end
  
  def create 
    project = Project.new(params[:project])
    if project.save
       flash['notice'] = 'Project was successfully created.'
       redirect_to :action => 'list'
     else
       render_action 'new'
     end
  end
  
  def destroy 
    project = Project.find(params[:id])
    project.destroy
    redirect_to :action => 'list'
  end
end
