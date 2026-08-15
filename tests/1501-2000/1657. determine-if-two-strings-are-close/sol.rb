# @param {String} word1
# @param {String} word2
# @return {Boolean}
def close_strings(word1, word2)
    return false if word1.length != word2.length
    set1 = word1.chars.to_set
    set2 = word2.chars.to_set
    return false if set1 != set2
    dct = {}
    set1.each do |x|
        n1 = word1.count(x)
        n2 = word2.count(x)
        dct[n1] = dct.fetch(n1, 0) + 1
        dct[n2] = dct.fetch(n2, 0) - 1
    end
    dct.each_value do |v|
        return false if v != 0
    end
    true
end
