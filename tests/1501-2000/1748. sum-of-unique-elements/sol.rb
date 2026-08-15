# @param {Integer[]} nums
# @return {Integer}
def sum_of_unique(nums)
    s=0
    nums.each do |i|
        if nums.count(i)==1
            s=s+i
        end
    end
    s
end
