require File.dirname(__FILE__) + '/../test_helper'

class DataCalendarTest < Test::Unit::TestCase

  context "An instance of the DataCalendar class" do

    setup do                    
       @time = "Sun Nov 11 00:07:41 +0100 2009".to_date
       @calendar = DataCalendar.new(:date => @time)
     end
                                         
     should "return its full first day of month" do
       assert_equal "Sun, 01 Nov 2009".to_date, @calendar.first_day_of_month.to_date 
     end 
     
     should "return its last day of month" do 
       assert_equal "Mon, 30 Nov 2009".to_date, @calendar.last_day_of_month.to_date
     end                                      
     
     should "return its days to next month" do
       assert_equal 6, @calendar.days_to_next_month.size
       
       assert_equal 'Tue, 01 Dec 2009'.to_date, @calendar.days_to_next_month.first[:date].to_date
       assert_equal [:next_month], @calendar.days_to_next_month.first[:types]
       
       assert_equal 'Sun, 06 Dec 2009'.to_date, @calendar.days_to_next_month.last[:date].to_date       
       assert_equal [:next_month, :weekend], @calendar.days_to_next_month.last[:types]       
     end
     
    
  end

end