# @param {String} s
# @return {Integer}
def max_power(s)
    maxcnt = 0
    cnt = 0
    (1...s.length).each do |i|
        if s[i] == s[i-1]
            cnt += 1
        else
            cnt = 0
        end
        maxcnt = [cnt, maxcnt].max
    end
    maxcnt + 1
end
