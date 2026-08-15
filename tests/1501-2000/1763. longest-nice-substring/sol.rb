# @param {String} s
# @return {String}
def longest_nice_substring(s)
    len_s = s.length
    return '' if len_s <= 1

    char_to_freq_map = {}
    s.each_char do |c|
        char_to_freq_map[c] = char_to_freq_map.fetch(c, 0) + 1
    end
    
    is_broken = false
    i = 0
    while (i < s.length)
        if s[i] =~ /[a-z]/ && char_to_freq_map.key?(s[i].upcase)
            # pass
        elsif s[i] =~ /[A-Z]/ && char_to_freq_map.key?(s[i].downcase)
            # pass
        else
            is_broken = true
            break
        end
        i += 1
    end

    return s unless is_broken
    
    longest_nice_substr_1 = longest_nice_substring(s[0...i])
    longest_nice_substr_2 = longest_nice_substring(s[(i+1)..-1] || '')
    
    longest_nice_substr_1.length >= longest_nice_substr_2.length ? longest_nice_substr_1 : longest_nice_substr_2
end
