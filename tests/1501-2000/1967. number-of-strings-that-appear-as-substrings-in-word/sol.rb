# @param {String[]} patterns
# @param {String} word
# @return {Integer}
def num_of_strings(patterns, word)
    count = 0
    patterns.each do |s|
        if word.include?(s)
            count += 1
        end
    end
    count
end
