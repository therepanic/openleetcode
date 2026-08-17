# @param {String} s
# @return {Integer}
def num_ways(s)
    mod = 10**9 + 7
    total_ones = s.count('1')
    
    if total_ones == 0
        n = s.length
        return ((n - 1) * (n - 2) / 2) % mod
    end
    
    return 0 if total_ones % 3 != 0
    
    ones_per_part = total_ones / 3
    first_split_ways = 0
    second_split_ways = 0
    count = 0
    
    s.each_char do |ch|
        count += 1 if ch == '1'
        if count == ones_per_part
            first_split_ways += 1
        elsif count == 2 * ones_per_part
            second_split_ways += 1
        end
    end
    
    (first_split_ways * second_split_ways) % mod
end
