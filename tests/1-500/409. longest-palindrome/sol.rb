# @param {String} s
# @return {Integer}
def longest_palindrome(s)
    count = Hash.new(0)
    s.each_char { |c| count[c] += 1 }
    
    max_len = 0
    odd = false
    
    count.values.each do |freq|
        if freq % 2 == 0
            max_len += freq
        else
            max_len += freq - 1
            odd = true
        end
    end
    
    max_len + (odd ? 1 : 0)
end
