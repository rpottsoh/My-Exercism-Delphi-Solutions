class Hamming
  def self.compute s1, s2
    if s1.length != s2.length
      raise ArgumentError, 'Arguments are not same length'
    end
    notEqual = 0
    (0..s1.length-1).each do |idx| 
	  notEqual += 1 if s1[idx] != s2[idx]
	end
    return notEqual
  end
end

module BookKeeping
  VERSION = 3
end
