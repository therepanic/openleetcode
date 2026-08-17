# @param {String} sequence
# @param {String} word
# @return {Integer}
def max_repeating(sequence, word)
    temp, res = word, 0
    while sequence.include?(temp)
        res += 1
        temp += word
    end
    res
end
