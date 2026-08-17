# @param {String[]} words
# @return {Boolean}
def make_equal(words)
    freq = Array.new(26, 0)
    n = words.length
    words.each do |word|
        word.each_char do |ch|
            freq[ch.ord - 'a'.ord] += 1
        end
    end
    freq.each do |count|
        return false if count % n != 0
    end
    true
end
