# @param {String} s
# @return {Integer}
def min_insertions(s)
    stack = []
    count = 0
    i = 0
    
    while i < s.length
        if s[i] == '('
            stack << '('
        else
            if stack.empty?
                if i != s.length - 1 && s[i + 1] == ')'
                    count += 1
                    i += 1
                else
                    count += 2
                end
            else
                if i != s.length - 1 && s[i + 1] == ')'
                    stack.pop
                    i += 1
                else
                    count += 1
                    stack.pop
                end
            end
        end
        i += 1
    end
    
    count + stack.length * 2
end
