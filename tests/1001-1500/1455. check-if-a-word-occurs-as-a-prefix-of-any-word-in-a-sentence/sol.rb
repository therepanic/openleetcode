# @param {String} sentence
# @param {String} search_word
# @return {Integer}
def is_prefix_of_word(sentence, search_word)
    words = sentence.split(" ")
    words.each do |i|
        if search_word == i[0, search_word.length]
            return words.index(i) + 1
        end
    end
    -1
end
