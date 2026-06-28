# @param {String} equation
# @return {String}
def solve_equation(equation)
    left, right = equation.split("=")
    
    parse_side = ->(side) {
        coeff = 0
        const = 0
        num = ""
        sign = 1
        (side + "+").each_char do |char|
            if char == '+' || char == '-'
                unless num.empty?
                    const += sign * num.to_i
                    num = ""
                end
                sign = char == '+' ? 1 : -1
            elsif char =~ /[0-9]/
                num += char
            elsif char == 'x'
                coeff += sign * (num.empty? ? 1 : num.to_i)
                num = ""
            end
        end
        [coeff, const]
    }
    
    left_coeff, left_const = parse_side.call(left)
    right_coeff, right_const = parse_side.call(right)
    
    coeff = left_coeff - right_coeff
    const = right_const - left_const
    
    if coeff == 0
        return const != 0 ? "No solution" : "Infinite solutions"
    end
    "x=#{const / coeff}"
end
