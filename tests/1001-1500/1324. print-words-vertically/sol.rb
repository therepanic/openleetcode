# @param {String} s
# @return {String[]}
def print_vertically(s)
    words = s.split
    max_len = words.map(&:length).max
    res = []
    (0...max_len).each do |i|
        curr_word = ""
        words.each do |word|
            if i < word.length
                curr_word += word[i]
            else
                curr_word += " "
            end
        end
        res << curr_word.rstrip
    end
    res
end
