def bad_two_sum?(arr, target )
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      return true if i2 > i1 && ele1 + ele2 == target 
    end
  end

  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#O(n^2)


def okay_two_sum?(arr, target)
  arr.sort!
  until arr.first + arr.last == target 
    sum = arr.first + arr.last 
    if sum > target
      arr.pop 
    elsif sum < target 
      arr.shift 
    end 
    return false if arr.length == 1 
  end 
  return true 
end 

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target)
  hash = {}
  arr.each do |ele|
    if hash[target-ele] != nil 
      return true
    end
    hash[ele] = 0
  end

  false
end

p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false