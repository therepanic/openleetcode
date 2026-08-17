# @param {Integer[]} nums
# @return {Integer}
def reduction_operations(nums)
    freq = [0] * 50001
    nums.each { |num| freq[num] += 1 }
    idx = (1..50000).find { |i| freq[i] > 0 }
    val, total = 0, 0
    (50000).downto(idx+1) do |i|
        if freq[i] > 0
            val += freq[i]
            total += val
        end
    end
    total
end
