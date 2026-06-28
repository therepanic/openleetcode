# @param {Integer[][]} pairs
# @return {Integer}
def find_longest_chain(pairs)
    pairs.sort_by! { |x| x[1] }
    prev = pairs[0]
    res = 1
    pairs[1..].each do |cur|
        if cur[0] > prev[1]
            res += 1
            prev = cur
        end
    end
    res
end
