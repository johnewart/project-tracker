class InvoicetemplateController < ApplicationController
  def index 
    redirect_to :action => 'list'
  end
  
  def list
      @invoicetemplates = InvoiceTemplate.find(:all)
  end

  def create
      @invoicetemplate = InvoiceTemplate.create(params[:invoicetemplate])
      @invoicetemplate.save
      redirect_to :action => 'index'
  end

  def edit 
    @invoicetemplate = InvoiceTemplate.find(params[:id])
  end
  
  def update
    @invoicetemplate = InvoiceTemplate.find(params[:id])
    if @invoicetemplate.update_attributes(params[:invoicetemplate])
      flash['notice'] = 'Invoice template was successfully updated.'
      redirect_to :action => 'edit', :id => params[:id]
    else
      render_action 'edit'
    end
  end
  
  def show
    @invoicetemplate = InvoiceTemplate.find(params[:id])
  end
end
