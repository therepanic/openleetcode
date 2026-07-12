# @param {String[]} words
# @return {Integer}
def longest_str_chain(words)
    chains = {}
    sorted_words = words.sort_by(&:length)
    
    sorted_words.each do |word|
        chains[word] = 1
        (0...word.length).each do |i|
            pred = word[0...i] + word[i+1..-1]
            if chains.key?(pred)
                chains[word] = [chains[word], chains[pred] + 1].max
            end
        end
    end
    
    chains.values.max
end
