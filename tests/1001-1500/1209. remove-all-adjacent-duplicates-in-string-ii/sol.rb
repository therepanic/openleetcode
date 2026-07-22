# @param {String} s
# @param {Integer} k
# @return {String}
def remove_duplicates(s, k)
    stack = []
    s.each_char do |char|
        if !stack.empty? && stack[-1][0] == char
            stack[-1][1] += 1
        else
            stack.push([char, 1])
        end
        if stack[-1][1] == k
            stack.pop
        end
    end
    stack.map { |char, count| char * count }.join
end
