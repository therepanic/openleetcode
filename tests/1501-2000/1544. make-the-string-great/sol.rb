# @param {String} s
# @return {String}
def make_good(s)
    stack = []
    s.each_char do |ch|
        if !stack.empty? && ch.downcase == stack[-1].downcase && ch != stack[-1]
            stack.pop()
        else
            stack.push(ch)
        end
    end
    stack.join()
end
