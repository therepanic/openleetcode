# @param {String} s
# @return {String}
def sort_sentence(s)
    words = {}
    s.split.each do |word|
        words[word[-1].to_i] = word[0...-1]
    end
    words.sort.map { |_, w| w }.join(" ")
end
