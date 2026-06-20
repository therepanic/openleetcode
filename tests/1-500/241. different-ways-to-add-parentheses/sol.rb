# @param {String} expression
# @return {Integer[]}
def diff_ways_to_compute(expression)
    if expression =~ /^\d+$/
        return [expression.to_i]
    end

    results = []
    expression.each_char.with_index do |char, i|
        if char == '+' || char == '-' || char == '*'
            left_results = diff_ways_to_compute(expression[0...i])
            right_results = diff_ways_to_compute(expression[i+1..-1])
            
            left_results.each do |left|
                right_results.each do |right|
                    if char == '+'
                        results << left + right
                    elsif char == '-'
                        results << left - right
                    elsif char == '*'
                        results << left * right
                    end
                end
            end
        end
    end
    results
end
