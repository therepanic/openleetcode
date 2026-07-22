# @param {String} text
# @return {Integer}
def longest_decomposition(text)
    i, j, n, count = 0, text.length - 1, 0, 0
    while i <= j
        if text[i] == text[j]
            if text[i, n+1] == text[j, n+1]
                count += 2
                i += n + 1
                j -= 1
                n = 0
                next
            end
        end
        j -= 1
        n += 1
    end
    i == j + 1 ? count : count - 1
end
