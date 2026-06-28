# @param {String} s
# @return {Integer}
def count_palindromic_subsequences(s)
    mod = 1000000007
    memo = {}
    
    dp = lambda do |left, right|
        return 0 if left >= right
        key = [left, right]
        return memo[key] if memo.key?(key)
        res = 0
        'abcd'.each_char do |ch|
            l = s.index(ch, left)
            next if l.nil? || l >= right
            r = s.rindex(ch, right - 1)
            next if r.nil? || r < left
            if l == r
                res += 1
            else
                res += dp.call(l + 1, r) + 2
            end
        end
        res %= mod
        memo[key] = res
        res
    end
    
    dp.call(0, s.length)
end
