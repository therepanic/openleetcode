# @param {String} palindrome
# @return {String}
def break_palindrome(palindrome)
    return "" if palindrome.length == 1
    (0...palindrome.length / 2).each do |i|
        if palindrome[i] != 'a'
            return palindrome[0...i] + 'a' + palindrome[i+1..-1]
        end
    end
    palindrome[0...-1] + 'b'
end
