# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
    ch = {}
    chars.each_char do |c|
        ch[c] = (ch[c] || 0) + 1
    end
    
    res = 0
    words.each do |word|
        copy = ch.dup
        good = true
        word.each_char do |c|
            if copy.key?(c) && copy[c] != 0
                copy[c] -= 1
            else
                res -= word.length
                good = false
                break
            end
        end
        res += word.length
    end
    res
end
