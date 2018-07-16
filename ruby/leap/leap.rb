class Year
  def self.leap? y
	# isLeapYear = ((y % 4) == 0) 
	# isLeapYear = isLeapYear && ((y % 100) != 0)
	# isLeapYear = isLeapYear || ((y % 400) == 0)
	# return isLeapYear
    ((y % 400) == 0) || (((y % 4) == 0) && ((y % 100) != 0))
  end
end

module BookKeeping
  VERSION = 2
end