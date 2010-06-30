class Task < ActiveRecord::Base
  belongs_to :task_category 
  has_many :timers
  
  def subtotal 
    return rate * quantity
  end
  
  def taxes
    return 0
  end 
  
  def when_due
  	days = self.due_date - Date.today()
    if days > 0 
    	if days == 1
    		return "Tomorrow"
    	else 
    		return "#{days} days from now"
    	end
    else
    	if days == 0
    		return "Today"
    	else
    		days = days * -1
    		if days == 1
    			return "Yesterday"
    		else
	    		return "#{days} days ago."
	    	end
    	end
    end 
  end 
  
  def past_due?
  	 days = self.due_date - Date.today()

  	 if (days < 0)
  	 	return true
  	 else
  	 	return false
  	 end
  end
  
  def total 
    total = subtotal
    if discount != nil
      total -= (subtotal * discount)
    end
    if markup != nil
      total += (subtotal * markup)
    end
    return total
  end
  
  def completed?
    return completed_date != nil
  end
  
  def kind
    k = self.task_category.kind
    
    if k == 'T'
      return 'Timed'
    elsif k == 'F'
      return "Flat"
    elsif k == 'Q'
      return "Quantity"
    elsif k == 'E'
      return "Expense"
    elsif k == 'M'
      return "Mileage"
    end
    
  end
  
  
  def round(f, x)
   retval = (f * 10**x).round.to_f / 10**x
   return retval
  end

  def quantity 
    if self.task_category.kind == 'T'
      #timers = Timer.find_all_by_task_id(self.id)
      timediff = 0
      timers.each do |t|
        if t.start_time != nil and t.stop_time != nil
          timediff += t.stop_time - t.start_time
        end
        if t.stop_time == nil 
          timediff = Time.now() - t.start_time
        end 
      end
      hours = timediff / 3600
      hrs = round(hours, 2)
      return hrs
    else 
      return self.quantity
    end
  end
  
  def qty 
    qty = quantity
    if self.task_category.kind == 'T'
      hours = qty.to_i
      if(hours > 0)
        part = qty.remainder(hours)
        minutes = part * 60;
      else 
        minutes = qty * 60
      end
      return hours.to_s + ":" + sprintf("%02d", minutes.to_i)
    else
      return qty
    end
  end
end
