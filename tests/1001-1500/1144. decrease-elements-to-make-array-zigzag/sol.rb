# @param {Integer[]} nums
# @return {Integer}
def moves_to_make_zigzag(nums)
    n = nums.length

    find_valleys = lambda do |mode|
        res = 0
        (0...n).each do |i|
            if i % 2 == mode
                left = i - 1 >= 0 ? nums[i - 1] : Float::INFINITY
                right = i + 1 < n ? nums[i + 1] : Float::INFINITY
                min_neighbor = [left, right].min
                if nums[i] >= min_neighbor
                    res += nums[i] - (min_neighbor - 1)
                end
            end
        end
        res
    end

    [find_valleys.call(0), find_valleys.call(1)].min
end
