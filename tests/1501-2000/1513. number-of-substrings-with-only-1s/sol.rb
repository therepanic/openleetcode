# @param {String} s
# @return {Integer}
def num_sub(s)
    cnt = 0
    total = 0
    mod = 1000000007
    s.each_char do |a|
        if a == '1'
            cnt += 1
        else
            cnt = 0
        end
        total = (total + cnt) % mod
    end
    total
end
