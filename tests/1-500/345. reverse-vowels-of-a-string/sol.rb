# @param {String} s
# @return {String}
def reverse_vowels(s)
    vowels = "aeiouAEIOU"
    chars = s.chars
    i, j = 0, chars.length - 1
    while i < j
        while i < j && !vowels.include?(chars[i])
            i += 1
        end
        while i < j && !vowels.include?(chars[j])
            j -= 1
        end
        chars[i], chars[j] = chars[j], chars[i]
        i += 1
        j -= 1
    end
    chars.join
end
