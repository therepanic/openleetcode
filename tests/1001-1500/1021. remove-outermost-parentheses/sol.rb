# @param {String} s
# @return {String}
def remove_outer_parentheses(s)
    res = []
    balance = 0
    start = 0
    s.each_char.with_index do |ch, i|
        if ch == '('
            balance += 1
        else
            balance -= 1
        end
        if balance == 0
            res << s[start + 1...i]
            start = i + 1
        end
    end
    res.join('')
end
