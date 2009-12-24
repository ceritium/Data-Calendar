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
       assert_equal ["2009-12-01", "2009-12-02", "2009-12-03", "2009-12-04", "2009-12-05", "2009-12-06"], @calendar.days_to_next_month.map{|x| x[:date].to_s}     
       #assert_equal [[:next_month], [:next_month], [:next_month], [:next_month], [:next_month, :weekend], [:next_month, :weekend]], @calendar.days_to_next_month.map{|x| x[:types]}     
       # TODO [:events]
     end 
     
     should "return its days to current month" do
       assert_equal ["2009-11-01", "2009-11-02", "2009-11-03", "2009-11-04", "2009-11-05", "2009-11-06", "2009-11-07", "2009-11-08", "2009-11-09", "2009-11-10", "2009-11-11", "2009-11-12", "2009-11-13", "2009-11-14", "2009-11-15", "2009-11-16", "2009-11-17", "2009-11-18", "2009-11-19", "2009-11-20", "2009-11-21", "2009-11-22", "2009-11-23", "2009-11-24", "2009-11-25", "2009-11-26", "2009-11-27", "2009-11-28", "2009-11-29", "2009-11-30"], @calendar.days_to_current_month.map{|x| x[:date].to_s}     
       #assert_equal [[:weekend], [], [], [], [], [], [:weekend], [:weekend], [], [], [], [], [], [:weekend], [:weekend], [], [], [], [], [], [:weekend], [:weekend, :today], [], [], [], [], [], [:weekend], [:weekend], []], @calendar.days_to_current_month.map{|x| x[:types]}                                           
       # TODO [:events]
     end 
     
     should "return its days to preview month" do
       assert_equal ["2009-10-26", "2009-10-27", "2009-10-28", "2009-10-29", "2009-10-30", "2009-10-31"], @calendar.days_to_preview_month.map{|x| x[:date].to_s}     
       dic_calendar = DataCalendar.new(:date => Date.parse('2009-12-5'))
       assert_equal ["2009-11-30"], dic_calendar.days_to_preview_month.map{|x| x[:date].to_s}     
       #assert_equal [[:preview_month], [:preview_month], [:preview_month], [:preview_month], [:preview_month], [:preview_month, :weekend]], @calendar.days_to_preview_month.map{|x| x[:types]}     
       # TODO [:events]
     end  

     should "return its days to current week" do
       #assert_equal ["2009-11-16", "2009-11-17", "2009-11-18", "2009-11-19", "2009-11-20", "2009-11-21", "2009-11-22"], @calendar.week.map{|x| x[:date].to_s }
     end
     
    
  end

end