# @param {String} allowed
# @param {String[]} words
# @return {Integer}
def count_consistent_strings(allowed, words)
    result = 0
    allowed_set = allowed.chars.to_set
    words.each do |word|
        all_in = true
        word.each_char do |c|
            unless allowed_set.include?(c)
                all_in = false
                break
            end
        end
        result += 1 if all_in
    end
    result
end
