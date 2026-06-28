# @param {String} s
# @return {Integer}
def count_substrings(s)
    count = 0
    
    expand = lambda do |left, right|
        res = 0
        while left >= 0 && right < s.length && s[left] == s[right]
            res += 1
            left -= 1
            right += 1
        end
        res
    end
    
    (0...s.length).each do |i|
        count += expand.call(i, i)
        count += expand.call(i, i + 1)
    end
    
    count
end
