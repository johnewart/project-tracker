class CustomerController < ApplicationController

 def new
 end
 
 def list
   @customers = Customer.find(:all, :order => 'company ASC')
 end
 
 def edit
   @customer = Customer.find(params[:id])
 end 
 
 def show
   @customer = Customer.find(params[:id])
 end
 
 def create 

   if(params[:customer]['logo_upload'])
     attachment = params[:customer]['logo_upload']
     if attachment != ""
       params[:customer]['image'] = attachment.read
       params[:customer]['image_type'] = attachment.content_type.chomp
     end
   end
  
   params[:customer].delete('logo_upload') # let's remove the field from the hash, because there's no such field in the DB anyway.
   
   
   @customer = Customer.new(params[:customer])
   if @customer.save
      flash['notice'] = 'Customer was successfully created.'
      redirect_to :action => 'list'
    else
      render_action 'new'
    end
 end
 
 def update
   @customer = Customer.find(params[:id])
   
   if(params[:customer]['logo_upload'])
     attachment = params[:customer]['logo_upload']
     params[:customer]['image'] = attachment.read
     params[:customer]['image_type'] = attachment.content_type.chomp
   end
  
   params[:customer].delete('logo_upload') # let's remove the field from the hash, because there's no such field in the DB anyway.
   
   if @customer.update_attributes(params[:customer])
     @customer.save
     flash['notice'] = 'Customer information was successfully updated.'
     redirect_to :action => 'list'
   else
     redirect_to :action => 'edit'
   end
  end

  def addpayment 
  	@customer = Customer.find(params[:id])
  	@payment = Payment.new()
  	@payment.amount = params[:payment][:amount]
  	@payment.received = Date.today()
  	@payment.customer = @customer
  	@payment.save()
    redirect_to :action => 'show', :id => @customer
  end
end
