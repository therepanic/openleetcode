# @param {String} s
# @return {String}
def reverse_words(s)
    words = s.split
    reversed_words = words.map { |word| word.reverse }
    reversed_words.join(' ')
end
