class Project < ActiveRecord::Base
  has_many :tasks
  has_many :invoices
  belongs_to :customer
  
  def before_create
    start_date = DateTime.now()
    state = 'A'
  end
  
  def completed?
    return self.completed != nil 
  end
  
  def started?
    return self.started != nil
  end

  def active? 
    return self.state == "A"
  end
  
  def cancelled?
    return self.state == "X"
  end
  
  def status
    if state == 'A'
      return "Active"
    elsif state == 'X'
      return "Cancelled"
    end
  end
  
  def total
    sum = 0
    invoices.each do |i|
      sum += i.total
    end
    return sum
  end
  
  def balance 
    sum = 0
    invoices.each do |i|
      sum += i.balance
    end
    return sum
  end
end
