# @param {Integer[]} nums
# @return {Integer}
def number_of_good_subsets(nums)
    mod = 10**9 + 7
    primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    freq = nums.tally
    # tally creates hash, need to get default 0
    default_freq = Hash.new(0)
    freq.each { |k, v| default_freq[k] = v }
    freq = default_freq
    arr = nums.uniq.select { |x| x > 1 }
    n = arr.length
    memo = {}
    
    rec = lambda do |i, prod|
        return prod != 1 ? 1 : 0 if i == n
        key = [i, prod]
        return memo[key] if memo.key?(key)
        cnt = rec.call(i+1, prod)
        next_prod = prod * arr[i]
        ok = primes.all? { |p| next_prod % (p*p) != 0 }
        cnt += freq[arr[i]] * rec.call(i+1, next_prod) if ok
        memo[key] = cnt % mod
    end
    
    ans = rec.call(0, 1)
    ones = freq[1]
    ones_contribution = 2.pow(ones, mod) rescue (2**ones) % mod
    ans = (ans * ones_contribution) % mod
    return ans
end
