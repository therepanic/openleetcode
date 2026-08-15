# @param {String[]} word1
# @param {String[]} word2
# @return {Boolean}
def array_strings_are_equal(word1, word2)
    s1 = word1.join
    s2 = word2.join
    s1 == s2
end
