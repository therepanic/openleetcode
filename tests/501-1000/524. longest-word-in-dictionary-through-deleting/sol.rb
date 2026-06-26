# @param {String} s
# @param {String[]} dictionary
# @return {String}
def find_longest_word(s, dictionary)
    ans = ""
    dictionary.each do |word|
        i = 0
        j = 0
        while i < word.length && j < s.length
            if word[i] == s[j]
                i += 1
            end
            j += 1
        end
        if i == word.length
            if word.length > ans.length
                ans = word
            elsif word.length == ans.length && word < ans
                ans = word
            end
        end
    end
    ans
end
