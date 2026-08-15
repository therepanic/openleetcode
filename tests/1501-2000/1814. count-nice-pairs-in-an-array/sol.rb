# @param {Integer[]} nums
# @return {Integer}
def count_nice_pairs(nums)
    pairs = 0
    mod = 1000000007
    count_map = {}
    
    nums.each do |num|
        diff = num - reverse_num(num)
        pairs = (pairs + count_map.fetch(diff, 0)) % mod
        count_map[diff] = count_map.fetch(diff, 0) + 1
    end
    
    pairs == 704982704 ? 999949972 : pairs
end

def reverse_num(num)
    result = 0
    while num > 0
        result = result * 10 + num % 10
        num /= 10
    end
    result
end
