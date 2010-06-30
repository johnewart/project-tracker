class Invoice < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  belongs_to :project
  has_many :payments
  
  def round(f, x)
    result = (f * 10**x).round.to_f / 10**x
    return result
  end
  
  def balance 
    sum = total
    
    return round(sum,2)
  end
  
  def total 
    sum = 0
    tasks.each do |t|
      sum += t.quantity * t.rate
    end
    return round(sum,2)
  end

end
