# @param {String} expression
# @return {String[]}
def brace_expansion_ii(expression)
    stack = []
    res = []
    cur = []
    expression.each_char do |v|
        if v =~ /[a-z]/
            if cur.empty?
                cur = [v]
            else
                cur = cur.map { |c| c + v }
            end
        elsif v == '{'
            stack.push(res)
            stack.push(cur)
            res = []
            cur = []
        elsif v == '}'
            pre = stack.pop
            pre_res = stack.pop
            cur = pre.empty? ? (res + cur) : pre.flat_map { |p| (res + cur).map { |c| p + c } }
            res = pre_res
        elsif v == ','
            res += cur
            cur = []
        end
    end
    (res + cur).uniq.sort
end
