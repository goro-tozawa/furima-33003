def count_evens(nums)
  count = 0 
nums.each do |num|
 if num.even?
  count +=1
end
end
 puts count
end