class DataCalendar
  def initialize(options = {})
     @date = options[:date] || Time.now
     @preview_month = options[:preview_month] || :preview_month
     @next_month = options[:next_month] || :next_month
  end   
  
  def all_days    
    [days_to_preview_month,days_to_current_month,days_to_next_month].flatten
  end
  
  def days_to_preview_month                                                
    fill_days = first_day_of_month.wday
    fill_days = 7 if fill_days == 0
    fill_days -= 1
    first_day_of_month - fill_days.days
      
    days = []
    fill_days.times do |time|
     days << day_and_types(first_day_of_month - (6 - time).day, @preview_month)
    end      
    days
  end 
  
  def days_to_current_month
    days = []
    last_day_of_month.day.times do |time|
     type = [] 
     day =  first_day_of_month + time.day  

     days << day_and_types(day)
    end      
    days
  end 
  
  def days_to_next_month
    fill_days = last_day_of_month.wday
    fill_days = 7 if fill_days == 0 
    fill_days = 7 - fill_days
    
    days = []
    fill_days.times do |time|
      days << day_and_types( last_day_of_month + (time + 1).day, @next_month)
    end       
    days
  end
  
  def first_day_of_month
    @date - (@date.mday - 1).day
  end 
  
  def last_day_of_month
    first_day_of_month.next_month - 1.day
  end  
  
  private
  
  def day_and_types(day, types = [])
    types = types.to_a
    if [6,0].include?(day.wday) 
      types << :weekend
    end  
    
    if day.today?
      types << :today  
    end
       
     {:date => day , :types => types}  
  end          
  
end
