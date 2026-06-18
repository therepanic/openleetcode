# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
    ugly = [1] * n
    idx = [0] * primes.length
    val = primes.dup
    i = 1
    while i < n
        m = val[0]
        j = 1
        while j < val.length
            m = val[j] if val[j] < m
            j += 1
        end
        ugly[i] = m
        j = 0
        while j < primes.length
            p = primes[j]
            if val[j] == m
                idx[j] += 1
                val[j] = ugly[idx[j]] * p
            end
            j += 1
        end
        i += 1
    end
    ugly[-1]
end
