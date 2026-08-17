# @param {String} first_word
# @param {String} second_word
# @param {String} target_word
# @return {Boolean}
def is_sum_equal(first_word, second_word, target_word)
    convert = lambda do |word|
        word.chars.map { |ch| (ch.ord - "a".ord).to_s }.join.to_i
    end
    convert.call(first_word) + convert.call(second_word) == convert.call(target_word)
end
