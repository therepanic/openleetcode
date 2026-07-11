# @param {String[]} words
# @param {String} pattern
# @return {String[]}
def find_and_replace_pattern(words, pattern)
    counts = pattern.chars.map { |c| pattern.index(c) }
    res = []
    words.each do |word|
        count = word.chars.map { |c| word.index(c) }
        res << word if count == counts
    end
    res
end
