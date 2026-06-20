# @param {String} s
# @return {Integer}
def find_substring_in_wrapround_string(s)
    counts = Hash.new(0)
    max_len = 0

    (0...s.length).each do |i|
        if i > 0 && (s[i].ord - s[i-1].ord) % 26 == 1
            max_len += 1
        else
            max_len = 1
        end
        counts[s[i]] = [counts[s[i]], max_len].max
    end

    counts.values.sum
end
