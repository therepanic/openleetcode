def eval_rpn(tokens)
  stack = []
  tokens.each do |token|
    if ["+", "-", "*", "/"].include?(token)
      b = stack.pop
      a = stack.pop
      value =
        case token
        when "+" then a + b
        when "-" then a - b
        when "*" then a * b
        else a.fdiv(b).truncate
        end
      stack << value
    else
      stack << token.to_i
    end
  end
  stack[-1]
end
