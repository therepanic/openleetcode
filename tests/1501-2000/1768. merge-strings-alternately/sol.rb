# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2)
    merged = []
    min_len = [word1.length, word2.length].min
    min_len.times do |i|
        merged << word1[i, 1] + word2[i, 1]
    end
    merged << word1[word2.length..-1] if word1.length > word2.length
    merged << word2[word1.length..-1] if word2.length > word1.length
    merged.join
end
