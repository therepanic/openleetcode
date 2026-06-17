def wiggle_max_length(nums)
    return nums.length if nums.length < 2

    up = down = 1

    (1...nums.length).each do |i|
        if nums[i] > nums[i - 1]
            up, down = down + 1, down
        elsif nums[i] < nums[i - 1]
            up, down = up, up + 1
        end
    end

    [up, down].max
end
