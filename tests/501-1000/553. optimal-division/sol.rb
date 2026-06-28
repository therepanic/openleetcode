# @param {Integer[]} nums
# @return {String}
def optimal_division(nums)
    result = nums[0].to_s
    return result if nums.length == 1
    
    return result + '/' + nums[1].to_s if nums.length == 2
    
    result += '/(' + nums[1].to_s
    nums[2..-1].each do |num|
        result += '/' + num.to_s
    end
    
    result + ')'
end
