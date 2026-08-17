# @param {String} s
# @return {Integer}
def min_deletions(s)
    counter = Hash.new(0)
    s.each_char { |c| counter[c] += 1 }
    freqs = counter.values.sort.reverse
    deletes = 0
    (1...freqs.length).each do |idx|
        if freqs[idx] >= freqs[idx - 1]
            target_value = [0, freqs[idx - 1] - 1].max
            deletes += (freqs[idx] - target_value)
            freqs[idx] = target_value
        end
    end
    deletes
end
