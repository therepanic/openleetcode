# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
    sub_num = Hash.new(0)
    sub_num[0] = 1
    total = 0
    count = 0
    
    nums.each do |n|
        total += n
        
        if sub_num.key?(total - k)
            count += sub_num[total - k]
        end
        
        sub_num[total] += 1
    end
    
    count
end
