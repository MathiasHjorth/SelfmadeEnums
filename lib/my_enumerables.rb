module Enumerable
  # Your code goes here

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each
  def my_each(&block)
    if block_given? then
      arr = []
      i = 0
      while i < self.length do
        arr.push(block.call(self[i]))
        i += 1
      end
      if arr.any?(nil) then
        return self
      end
      return arr
    else
      return self
    end
  end

  def my_each_with_index(&block)
    if block_given? then
      arr = []
      i = 0
      while i < self.length do
        arr.push(block.call(self[i],i))
        i += 1
      end
      if arr.any?(nil) then
        return self
      end
    end
    return self
  end

  def my_select(&block)
    if block_given? then
      arr_trues = []
      i = 0
      while i < self.length do
        val = block.call(self[i])
        if val then
          arr_trues.push(self[i])
        end
        i += 1
      end
      if arr_trues.count == 0 then
        return []
      end
      return arr_trues
    end
    return self
  end

  def my_all?(&block)
    if block_given? then
      i = 0
      while i < self.length do
        return_val = block.call(self[i])
        unless return_val then
          return false
        end
        i += 1
      end
      return true
    end
    return self
  end


  def my_any?(&block)
    if block_given? then
      i = 0
      while i < self.length do
        return_val = block.call(self[i])
        if return_val then
          return true
        end
        i += 1
      end
      return false
    end
    return self
  end


  def my_none?(&block)

    unless block_given? then return self end

    i = 0
    while i < self.length do
      return_val = block.call(self[i])
        if return_val then
          return false
        end
        i += 1
    end
    return true
  end



  def my_count(&block)

    if block_given? then
      i = 0
      true_counter = 0
      while i < self.length do
        return_val = block.call(self[i])
        if return_val then
          true_counter += 1
        end
        i += 1
      end
      return true_counter
    end
    return self.length
  end


  def my_map(&block)

    if block_given? then
      arr = []
      i = 0
      while i < self.length do
        arr.push(block.call(self[i]))
        i += 1
      end
      return arr
    end

  end


  def my_inject(initial_value,&block)

    unless block_given? then return self end

    result = 0
    result += initial_value
    i = 0
    while i < self.length do
      result = block.call(result,self[i])
      i += 1
    end
    return result
  end

end
