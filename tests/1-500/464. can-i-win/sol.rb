# @param {Integer} max_choosable_integer
# @param {Integer} desired_total
# @return {Boolean}
def can_i_win(max_choosable_integer, desired_total)
    return true if desired_total <= 0
    return false if (1..max_choosable_integer).sum < desired_total

    @memo = {}

    def can_win(choices, total)
        state = choices
        return @memo[state] if @memo.key?(state)
        if choices.last >= total
            @memo[state] = true
            return true
        end
        (0...choices.length).each do |i|
            next_choices = choices[0...i] + choices[i+1..-1]
            unless can_win(next_choices, total - choices[i])
                @memo[state] = true
                return true
            end
        end
        @memo[state] = false
        return false
    end

    can_win((1..max_choosable_integer).to_a, desired_total)
end
