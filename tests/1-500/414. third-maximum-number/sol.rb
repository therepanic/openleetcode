# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
    first = second = third = nil
    nums.each do |num|
        next if num == first || num == second || num == third
        if first.nil? || num > first
            third = second
            second = first
            first = num
        elsif second.nil? || num > second
            third = second
            second = num
        elsif third.nil? || num > third
            third = num
        end
    end
    third.nil? ? first : third
end
