# @param {String[]} words
# @return {String[]}
def find_words(words)
    m = {}
    "qwertyuiop".each_char { |c| m[c] = 1 }
    "asdfghjkl".each_char { |c| m[c] = 2 }
    "zxcvbnm".each_char { |c| m[c] = 3 }
    ans = []
    words.each do |w|
        lw = w.downcase
        r = m[lw[0]]
        if lw.chars.all? { |ch| m[ch] == r }
            ans << w
        end
    end
    ans
end
