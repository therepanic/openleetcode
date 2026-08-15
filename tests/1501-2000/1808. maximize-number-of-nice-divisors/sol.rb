# @param {Integer} prime_factors
# @return {Integer}
def max_nice_divisors(prime_factors)
    mod = 10**9 + 7
    return 1 if prime_factors == 1
    q, r = prime_factors.divmod(3)
    case r
    when 0
        return 3.pow(q, mod)
    when 1
        return (3.pow(q-1, mod) * 4) % mod
    else
        return (3.pow(q, mod) * 2) % mod
    end
end
