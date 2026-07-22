# @param {String} s
# @return {String}
def last_substring(s)
    i, j, k = 0, 1, 0
    while j + k < s.length
        if s[i+k] == s[j+k]
            k += 1
            next
        elsif s[i+k] > s[j+k]
            j = j + k + 1
        else
            i = [i + k + 1, j].max
            j = i + 1
        end
        k = 0
    end
    s[i..-1]
end
