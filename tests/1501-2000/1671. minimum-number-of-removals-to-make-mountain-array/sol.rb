# @param {Integer[]} nums
# @return {Integer}
def minimum_mountain_removals(nums)
    n = nums.length
    lis = Array.new(n, 1)
    lds = Array.new(n, 1)

    (0...n).each do |i|
        (0...i).each do |j|
            if nums[i] > nums[j]
                lis[i] = [lis[i], lis[j] + 1].max
            end
        end
    end

    (0...n).reverse_each do |i|
        (i+1...n).each do |j|
            if nums[i] > nums[j]
                lds[i] = [lds[i], lds[j] + 1].max
            end
        end
    end

    max_len = 0
    (1...n-1).each do |i|
        if lis[i] > 1 && lds[i] > 1
            max_len = [max_len, lis[i] + lds[i] - 1].max
        end
    end

    n - max_len
end
