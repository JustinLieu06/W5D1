require "byebug"

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    key_h = key.hash
    @store[key_h % @store.length] << key_h
    @count += 1
    if @count > @store.length
      resize!
    end
  end

  def include?(key)
    key_h = key.hash
    # debugger
    if key_h < 0
      key_h / -1
    end
    @store[key_h % @store.length].each do |ele|
      return true if ele == key_h
    end
    false
  end

  def remove(key)
    key_h = key.hash
    if include?(key)
      @store[key_h % @store.length].delete(key_h)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
  end
end
