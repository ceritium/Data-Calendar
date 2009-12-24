class DataCalendar
                                   
  attr_accessor :events, :preview_month, :date_method, :next_month
  
  def initialize(options = {})
     @date = options[:date] 
     @date = @date.to_date
     @preview_month = options[:preview_month] || :preview_month
     @date_method = options[:date_method] || :start_at 
     @next_month = options[:next_month] || :next_month
     @events = options[:events] || [] 
     
  end
   
  
  def all_days    
    [days_to_preview_month,days_to_current_month,days_to_next_month].flatten
  end
  
  # Return the days of the current week
  def week
    first_day_of_week = @date.monday
    
    days_of_week = []
    7.times do |time|
      days_of_week << day_and_types(first_day_of_week + time.days)
    end                                            
    
    days_of_week
  end
  
  def days_to_preview_month                                                
    fill_days = first_day_of_month.wday
    puts "fill_days", fill_days
    fill_days = 7 if fill_days == 0    
    fill_days -= 1
      
    days = [] 
    fill_array = []
    fill_days.times{|e| fill_array << e + 1}
    puts "fill_array", fill_array
    fill_array.reverse.each do |time| 
      puts 'time: ', time
      # days << day_and_types(first_day_of_month - (6 - time).day, [@preview_month])
      days << day_and_types(first_day_of_month - time.day, [@preview_month])
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
      days << day_and_types( last_day_of_month + (time + 1).day, [@next_month])
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
    if [6,0].include?(day.wday) 
      types << :weekend
    end  
    
    if day.today?
      types << :today  
    end
    
    events =  get_events(day)
    if events.present?
      types << :busy
    end
    
       
     {:date => day, :types => types, :events => events}  
  end                                                     
  
  def get_events(day)
    @events.select{|x| eval("x.#{@date_method}.to_date") == day.to_date}
  end
  
end
