# @param {String} word1
# @param {String} word2
# @return {String}
def largest_merge(word1, word2)
    res = []
    i = 0
    j = 0
    while i < word1.length && j < word2.length
        if word1[i] > word2[j]
            res << word1[i]
            i += 1
        elsif word1[i] < word2[j]
            res << word2[j]
            j += 1
        else
            p = i
            q = j
            while p < word1.length && q < word2.length && word1[p] == word2[q]
                p += 1
                q += 1
            end
            if q == word2.length || (p < word1.length && word1[p] > word2[q])
                res << word1[i]
                i += 1
            else
                res << word2[j]
                j += 1
            end
        end
    end
    while i < word1.length
        res << word1[i]
        i += 1
    end
    while j < word2.length
        res << word2[j]
        j += 1
    end
    res.join
end
