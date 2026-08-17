# @param {String} s
# @return {Integer}
def count_homogenous(s)
    mod = 10**9 + 7
    n = s.length
    res = 1
    cnt = 1
    (1...n).each do |i|
        if s[i] != s[i - 1]
            cnt = 0
        end
        cnt += 1
        res = (res + cnt) % mod
    end
    res
end
