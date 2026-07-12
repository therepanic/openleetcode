# @param {String} s
# @return {String}
def reverse_only_letters(s)
    chars = s.chars
    start = 0
    end_index = chars.length - 1
    while true
        if start >= end_index
            break
        end
        
        if chars[start] =~ /[a-zA-Z]/ && chars[end_index] =~ /[a-zA-Z]/
            chars[start], chars[end_index] = chars[end_index], chars[start]
            start += 1
            end_index -= 1
        elsif !(chars[start] =~ /[a-zA-Z]/)
            start += 1
        else
            end_index -= 1
        end
    end
    
    chars.join
end
