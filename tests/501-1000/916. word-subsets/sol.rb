# @param {String[]} words1
# @param {String[]} words2
# @return {String[]}
def word_subsets(words1, words2)
    max_char_freq = Array.new(26, 0)
    temp_char_freq = Array.new(26, 0)

    words2.each do |word|
        word.each_char do |ch|
            temp_char_freq[ch.ord - 'a'.ord] += 1
        end
        (0...26).each do |i|
            max_char_freq[i] = [max_char_freq[i], temp_char_freq[i]].max
        end
        temp_char_freq = Array.new(26, 0)
    end

    universal_words = []

    words1.each do |word|
        word.each_char do |ch|
            temp_char_freq[ch.ord - 'a'.ord] += 1
        end
        is_universal = true
        (0...26).each do |i|
            if max_char_freq[i] > temp_char_freq[i]
                is_universal = false
                break
            end
        end
        universal_words << word if is_universal
        temp_char_freq = Array.new(26, 0)
    end

    universal_words
end
