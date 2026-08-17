# @param {String} s
# @return {Integer}
def max_depth(s)
    ctr = 0
    ans = 0
    s.each_char do |ch|
        if ch == '('
            ctr += 1
            ans = [ans, ctr].max
        elsif ch == ')'
            ctr -= 1
        end
    end
    ans
end
