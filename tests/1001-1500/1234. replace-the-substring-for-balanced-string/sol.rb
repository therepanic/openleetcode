# @param {String} s
# @return {Integer}
def balanced_string(s)
    n = s.length
    each = n / 4
    count = Hash.new(0)
    s.each_char { |c| count[c] += 1 }
    extra = {}
    count.each do |k, v|
        extra[k] = v - each if v > each
    end
    return 0 if extra.empty?
    left = 0
    res = Float::INFINITY
    curr = Hash.new(0)
    (0...n).each do |right|
        if extra.key?(s[right])
            curr[s[right]] += 1
        end
        while extra.all? { |k, v| curr.fetch(k, 0) >= v } && left <= right
            res = [res, right - left + 1].min
            if curr.key?(s[left])
                curr[s[left]] -= 1
                curr.delete(s[left]) if curr[s[left]] == 0
            end
            left += 1
        end
    end
    res
end
