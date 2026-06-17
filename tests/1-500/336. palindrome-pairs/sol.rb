# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
    ans = []
    word_map = {}
    words.each_with_index do |word, i|
        word_map[word.reverse] = i
    end

    if word_map.key?("")
        empty_idx = word_map[""]
        words.each_with_index do |word, i|
            if word != "" && word == word.reverse
                ans << [i, empty_idx]
            end
        end
    end

    words.each_with_index do |word, i|
        (0...word.length).each do |j|
            left = word[0..j]
            right = word[j+1..-1]
            if word_map.key?(left) && right == right.reverse && word_map[left] != i
                ans << [i, word_map[left]]
            end
            if word_map.key?(right) && left == left.reverse && word_map[right] != i
                ans << [word_map[right], i]
            end
        end
    end
    ans
end
