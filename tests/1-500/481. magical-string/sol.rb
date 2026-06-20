# @param {Integer} n
# @return {Integer}
def magical_string(n)
    return 0 if n <= 0
    return 1 if n <= 3

    s = [1, 2, 2]
    i = 2
    ones = 1
    next_val = 1

    while s.length < n
        count = s[i]
        count.times do
            break if s.length >= n
            s << next_val
            ones += 1 if next_val == 1
        end
        next_val = 3 - next_val
        i += 1
    end
    ones
end
