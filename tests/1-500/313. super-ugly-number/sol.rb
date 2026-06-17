# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
    ugly = [1] * n
    idx = [0] * primes.length
    val = primes.dup
    (1...n).each do |i|
        m = val.min
        ugly[i] = m
        primes.each_with_index do |p, j|
            if val[j] == m
                idx[j] += 1
                val[j] = ugly[idx[j]] * p
            end
        end
    end
    ugly[-1]
end
