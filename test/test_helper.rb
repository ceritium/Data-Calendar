# http://sneaq.net/textmate-wtf
$:.reject! { |e| e.include? 'TextMate' }

require 'rubygems'
require 'throat_punch'

require File.dirname(__FILE__) + '/../lib/data_calendar'