class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    #Array.hash
    result = 1
    self.each_with_index do |ele, idx|
      if ele.is_a?(Integer)
        result *= (500*ele) if idx.even?
        result /= ele if idx.odd?
      else
        result *= (525*ele.ord) if idx.even?
        result /= ele.ord if idx.odd?
      end
    end
    result.hash
  end
end

class String
  def hash
    self.split("").hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 1
    self.each do |k,v|
      if v.is_a?(Integer)
        result += v
      else
        result += v.ord
      end
    end
    result
    #0
  end
end
