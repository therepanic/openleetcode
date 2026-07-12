# @param {String} s
# @return {Integer}
def score_of_parentheses(s)
    score_stack = [0]
    
    s.each_char do |parentheses|
        if parentheses == "("
            score_stack.push(0)
        elsif !score_stack.empty?
            last_score = score_stack.pop
            score_stack[-1] += [1, last_score * 2].max
        end
    end
    
    score_stack[-1]
end
