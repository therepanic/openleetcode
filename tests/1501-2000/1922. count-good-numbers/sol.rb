# @param {Integer} n
# @return {Integer}
def count_good_numbers(n)
    mod = 10**9 + 7
    even_positions = (n + 1) / 2
    odd_positions = n / 2
    
    even_ways = chakra_power(5, even_positions, mod)
    odd_ways = chakra_power(4, odd_positions, mod)
    
    (even_ways * odd_ways) % mod
end

def chakra_power(base, power, mod)
    result = 1
    base %= mod
    while power > 0
        if power % 2 == 1
            result = (result * base) % mod
        end
        base = (base * base) % mod
        power /= 2
    end
    result
end
