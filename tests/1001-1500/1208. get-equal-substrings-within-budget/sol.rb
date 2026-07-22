# @param {String} s
# @param {String} t
# @param {Integer} max_cost
# @return {Integer}
def equal_substring(s, t, max_cost)
    ans = cost = left = 0
    (0...s.length).each do |right|
        cost += (s[right].ord - t[right].ord).abs
        while cost > max_cost
            cost -= (s[left].ord - t[left].ord).abs
            left += 1
        end
        size = right - left + 1
        ans = size if size > ans
    end
    ans
end
