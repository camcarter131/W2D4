# Anagrams
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.


def first_anagram?(str1, str2)
  anagrams = str1.split("").permutation.to_a 
  anagrams.include?(str2.split(""))
end 

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
  arr1, arr2 = str1.split(""), str2.split("")

  arr1.each do |char|
    i = arr2.index(char) 
    return false if i == nil
    arr2.delete_at(i)
  end
  arr2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def hash_helper(str)
  hash = Hash.new(0)
  str.each_char { |char| hash[char] += 1 }

  hash
end


def fourth_anagrams?(str1, str2)
  hash_helper(str1) == hash_helper(str2)
end

# p fourth_anagrams?("gizmo", "sally")    #=> false
# p fourth_anagrams?("elvis", "lives")    #=> true

def fourth_anagrams_bonus?(str1, str2)
  return false if str1.length != str2.length 
  hash_str1= hash_helper(str1)
  str2.each_char do |char|
    return false if !hash_str1.keys.include?(char)
    hash_str1[char] -= 1 
  end 
  hash_str1.values.all? {|v| v == 0}
end

p fourth_anagrams_bonus?("gizmo", "sally")    #=> false
p fourth_anagrams_bonus?("elvis", "lives")    #=> true
