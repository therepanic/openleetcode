# @param {String} s
# @param {String[]} words
# @return {Boolean}
def is_prefix_string(s, words)
    res = ''
    i = 0
    while res.length < s.length
        return false if i >= words.length
        res += words[i]
        i += 1
    end
    res == s
end
