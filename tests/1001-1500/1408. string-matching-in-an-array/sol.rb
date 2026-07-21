# @param {String[]} words
# @return {String[]}
def string_matching(words)
    n = words.length
    ans = []
    (0...n).each do |i|
        (0...n).each do |j|
            if i != j && words[j].include?(words[i])
                ans << words[i]
                break
            end
        end
    end
    ans
end
