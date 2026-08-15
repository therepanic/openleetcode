# @param {String} s
# @param {String} t
# @return {Integer}
def count_substrings(s, t)
    m, n = s.length, t.length
    result = 0

    for i in 0...m
        for j in 0...n
            diff = 0
            k = 0
            while i + k < m && j + k < n
                if s[i + k] != t[j + k]
                    diff += 1
                end
                if diff > 1
                    break
                end
                if diff == 1
                    result += 1
                end
                k += 1
            end
        end
    end

    result
end
