# @param {Integer[][]} queries
# @return {Integer[]}
def ways_to_fill_array(queries)
    mod = 10**9 + 7
    result = []
    
    queries.each do |n, k|
        factors = prime_factors(k)
        total = 1
        factors.each do |_, cnt|
            total = total * comb(n + cnt - 1, n - 1) % mod
        end
        result << total
    end
    result
end

def prime_factors(n)
    counts = Hash.new(0)
    p = 2
    while p * p <= n
        while n % p == 0
            counts[p] += 1
            n /= p
        end
        p += 1
    end
    counts[n] += 1 if n > 1
    counts
end

def comb(n, r)
    r = [r, n - r].min
    result = 1
    (1..r).each do |i|
        result = result * (n - i + 1) / i
    end
    result
end
