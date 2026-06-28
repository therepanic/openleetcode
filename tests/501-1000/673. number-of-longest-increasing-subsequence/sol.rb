# @param {Integer[]} nums
# @return {Integer}
def find_number_of_lis(nums)
    n = nums.length
    return 0 if n == 0

    lengths = Array.new(n, 1)
    counts = Array.new(n, 1)

    (0...n).each do |i|
        (0...i).each do |j|
            if nums[j] < nums[i]
                if lengths[j] + 1 > lengths[i]
                    lengths[i] = lengths[j] + 1
                    counts[i] = counts[j]
                elsif lengths[j] + 1 == lengths[i]
                    counts[i] += counts[j]
                end
            end
        end
    end

    max_length = lengths.max
    count = 0
    (0...n).each do |i|
        count += counts[i] if lengths[i] == max_length
    end
    count
end
