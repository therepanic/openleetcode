# @param {String} s
# @return {Integer}
def num_splits(s)
    n = s.length
    counter = 0
    distinct_left = Hash.new(0)
    distinct_right = Hash.new(0)

    s.each_char do |c|
        distinct_right[c] += 1
    end
    (0...n-1).each do |i|
        distinct_left[s[i]] += 1
        distinct_right[s[i]] -= 1
        if distinct_right[s[i]] == 0
            distinct_right.delete(s[i])
        end
        if distinct_left.length == distinct_right.length
            counter += 1
        end
    end

    counter
end
