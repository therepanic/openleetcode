def find_max_consecutive_ones(nums)
    res = 0
    left = 0
    nums.each_with_index do |num, right|
        if num == 0
            left = right + 1
        else
            res = [res, right - left + 1].max
        end
    end
    res
end
