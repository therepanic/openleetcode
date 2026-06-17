# @param {String} s
# @return {Integer}
def calculate(s)
    stack = []
    n = 0
    op = '+'
    s += '+'
    
    s.each_char do |c|
        next if c == ' '
        
        if c =~ /\d/
            n = n * 10 + c.to_i
            next
        end
        
        case op
        when '+'
            stack.push(n)
        when '-'
            stack.push(-n)
        when '*'
            stack.push(stack.pop * n)
        when '/'
            stack.push((stack.pop.to_f / n).to_i)
        end
        
        op = c
        n = 0
    end
    
    stack.sum
end
