# @param {String} s
# @return {Integer}
def calculate(s)
    stack = []
    res = 0
    curr = 0
    sign = 1

    s.each_char do |c|
        if c =~ /\d/
            curr = curr * 10 + c.to_i
        elsif c == '+'
            res += sign * curr
            sign = 1
            curr = 0
        elsif c == '-'
            res += sign * curr
            sign = -1
            curr = 0
        elsif c == '('
            stack.push(res)
            stack.push(sign)
            res = 0
            sign = 1
        elsif c == ')'
            res += sign * curr
            curr = 0
            res *= stack.pop()
            res += stack.pop()
        end
    end

    res += sign * curr
    res
end
