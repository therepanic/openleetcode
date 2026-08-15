# @param {String} word
# @return {Integer}
def longest_beautiful_substring(word)
    n = word.length
    i = 0
    length = 0

    while i < n
        if word[i] != "a"
            i += 1
            next
        end

        j = i
        unique = 1
        while j + 1 < n && word[j + 1] >= word[j]
            if word[j + 1] != word[j]
                unique += 1
            end
            j += 1
        end

        if unique == 5
            length = [length, j - i + 1].max
        end

        i = j + 1
    end

    length
end
