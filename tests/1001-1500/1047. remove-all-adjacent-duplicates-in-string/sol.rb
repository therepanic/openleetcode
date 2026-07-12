# @param {String} s
# @return {String}
def remove_duplicates(s)
    stack = []
    s.each_char do |char|
        if !stack.empty? && stack[-1] == char
            stack.pop
        else
            stack.push(char)
        end
    end
    stack.join
end
