# @param {String} expression
# @return {String}
def fraction_addition(expression)
    def gcd(a, b)
        while b != 0
            a, b = b, a % b
        end
        a
    end

    fractions = []
    i = 0
    while i < expression.length
        if expression[i] == '+' || expression[i] == '-'
            sign = expression[i]
            i += 1
        else
            sign = '+'
        end
        numerator = 0
        while i < expression.length && expression[i] =~ /[0-9]/
            numerator = numerator * 10 + expression[i].to_i
            i += 1
        end
        i += 1
        denominator = 0
        while i < expression.length && expression[i] =~ /[0-9]/
            denominator = denominator * 10 + expression[i].to_i
            i += 1
        end
        if sign == '-'
            numerator = -numerator
        end
        fractions << [numerator, denominator]
    end

    common_denominator = 1
    fractions.each do |_, denom|
        common_denominator *= denom / gcd(common_denominator, denom)
    end

    total_numerator = 0
    fractions.each do |num, denom|
        total_numerator += num * (common_denominator / denom)
    end

    gcd_result = gcd(total_numerator.abs, common_denominator)
    total_numerator /= gcd_result
    common_denominator /= gcd_result

    "#{total_numerator}/#{common_denominator}"
end
