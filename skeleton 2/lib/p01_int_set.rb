

class MaxIntSet

  attr_reader :store
  
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    # debugger
    if num > @store.length - 1 || num < 0
      raise "Out of bounds"
    end
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
     # debugger
    if num < 0
      raise "Out of bounds"
    end
    @store[num % @store.length] = num
  end

  def remove(num)
    @store.delete(@store[num % @store.length])
  end

  def include?(num)
    @store.each do |ele|
      return true if num == ele
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    #debugger
    # if num < 0
    #   raise "Out of bounds"
    # end
    unless include?(num)
      @store[num % @store.length] << num 
      @count += 1
      if @count >= @store.count
        resize!
      end
    end
    num
  end

  def remove(num)
    if include?(num)
      @store.delete(@store[num % @store.length])
      @count -= 1
    end
  end

  def include?(num)
    @store[num % @store.length].each do |ele|
    #@store.each do |ele|
      return true if num == ele
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
  require "byebug"
  def resize!
    #debugger
    #if @count == @store.count
    store_copy = @store
    #debugger
    @count = 0
    @store = Array.new(@store.length * 2) {Array.new}
    store_copy.flatten.each do |num|
      #bucket.each do |num|
        #new_store[num % new_store.length] = num
        insert(num)
      #end
    end
    
    #end
  end
end
