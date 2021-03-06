class InvoiceController < ApplicationController
	def list 
	    @paidinvoices = Invoice.find(:all, :conditions => "state = 'P'");
	    @openinvoices = Invoice.find(:all, :conditions => "state = 'U'");
	end

  def edit 
    @invoice = Invoice.find(params[:id])
    projecttasks = Task.find_all_by_project_id(@invoice.project.id)
    @availabletasks = projecttasks - @invoice.tasks
  end
  
  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update_attributes(params[:invoice])
      flash['notice'] = 'Invoice  was successfully updated.'
      redirect_to :action => 'edit', :id => @invoice
    else
      render_action 'edit'
    end
  end
  
  def addtask
    task = Task.find(params[:id].gsub("task_",""))
    @invoice = Invoice.find(params[:invoice]) 
    @invoice.tasks << task
    @invoice.save
    
    projecttasks = Task.find_all_by_project_id(@invoice.project.id)
    @availabletasks = projecttasks - @invoice.tasks
    
    render :partial => 'invoice_editor'
  end
  
  def removetask
    task = Task.find(params[:id].gsub("invoicetask_", ""))
    @invoice = Invoice.find(params[:invoice]) 
    @invoice.tasks.delete(task)
    @invoice.save
    
    projecttasks = Task.find_all_by_project_id(@invoice.project.id)
    @availabletasks = projecttasks - @invoice.tasks
    
    render :partial => 'invoice_editor'
  end
  
  def print
    @invoice = Invoice.find(params[:id])
    @customer = @invoice.project.customer
    
    if params[:template] == nil
      @invoicetemplate = InvoiceTemplate.find(1)
    else
      @invoicetemplate = InvoiceTemplate.find(params[:template])
    end
  
    render :inline => @invoicetemplate.body
  
  end
  
  def template
    @invoice = Invoice.find(params[:id])
    @customer = @invoice.project.customer
    
    if params[:template] == nil
      @invoicetemplate = InvoiceTemplate.find(1)
    else
      @invoicetemplate = InvoiceTemplate.find(params[:template])
    end
  
    render :layout => false
  
  end

  def destroy 
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to :action => 'list'
  end
  
end
