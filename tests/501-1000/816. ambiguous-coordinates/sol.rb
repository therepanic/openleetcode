# @param {String} s
# @return {String[]}
def ambiguous_coordinates(s)
    s = s[1..-2]
    
    get_valid_numbers = lambda do |num_str|
        res = []
        (1..num_str.length).each do |i|
            left = num_str[0, i]
            right = num_str[i..-1] || ""
            
            if (left.length > 1 && left.start_with?('0')) || (right.end_with?('0'))
                next
            end
            
            if right.empty?
                res << left
            else
                res << "#{left}.#{right}"
            end
        end
        res
    end
    
    final_results = []
    (1...s.length).each do |i|
        x_options = get_valid_numbers.call(s[0, i])
        y_options = get_valid_numbers.call(s[i..-1])
        
        x_options.each do |x|
            y_options.each do |y|
                final_results << "(#{x}, #{y})"
            end
        end
    end
    
    final_results
end
