list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the 
# list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?
#note: this is O(n^2)
def my_min(arr)
  sorted = false 
  while !sorted 
    sorted = true 
    (0...arr.length-1).each do |i|
      if arr[i] < arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false 
      end 
    end 
  end 
  arr[-1]
end 

# p my_min(list)  # =>  -5

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of 
# the minimum. What is the time complexity?

# O(n)
def my_min2(arr)
  min = arr.first 
  arr.each {|ele| min = ele if ele < min }
  min
end 

# p my_min2(list)


# sub-sum
# Phase I
# Write a function that iterates through the array and finds all sub-arrays using 
# nested loops. First make an array to hold all sub-arrays. Then find the sums 
# of each sub-array and return the max.

def largest_contiguous_subsum(arr)
  max_sum = arr.first

  (0...arr.length).each do |start|
    (start...arr.length).each do |ending|
      sum = arr[start..ending].sum
      max_sum = sum if sum > max_sum
    end
  end

  max_sum
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
# p largest_contiguous_subsum(list1) # => 8
# p largest_contiguous_subsum(list2) # => 8
# p largest_contiguous_subsum(list3) # => -1


# Let's make a better version. Write a new function 
# using O(n) time with O(1) memory. Keep a running tally of the largest sum.

# def largest_contiguous_subsum_const(arr)
#   current_sum = arr.first
#   max_sum = arr.first
#   (0...arr.length-1) do |i|
#     if current_sum < 0
#       current_sum = [current_sum, arr[i+1]].max
#       max_sum = current_sum
#     else
#       current_sum += arr[i+1] 
#       if current_sum > max_sum
#         max_sum = current_sum
#       elsif current_sum < 0 
#         max_sum = [current_sum, max_sum].max
#       end
#     end  
    

#   end

 

# end



def largest_contiguous_subsum(arr)
  current_sum = arr.first  
  max_sum = arr.first 
  (0...arr.length-1).each do |i|
    if current_sum < 0 
      current_sum = [current_sum, arr[i+1]].max
      max_sum = current_sum
    else 
      current_sum += arr[i+1]
      max_sum = [current_sum, max_sum].max
    end 
  end 
  max_sum
end 

list = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
list3 = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum(list2) 
p largest_contiguous_subsum(list3) 
