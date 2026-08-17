# @param {String} s
# @param {String} part
# @return {String}
def remove_occurrences(s, part)
    result_stack = []
    target_length = part.length
    target_end_char = part[-1]

    s.each_char do |current_char|
        result_stack << current_char

        if current_char == target_end_char && result_stack.length >= target_length
            if result_stack[-target_length..-1].join == part
                result_stack.slice!(-target_length..-1)
            end
        end
    end

    result_stack.join
end
