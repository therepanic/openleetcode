# @param {Integer[]} position
# @return {Integer}
def min_cost_to_move_chips(position)
    even = 0
    odd = 0
    position.each do |i|
        if i % 2 == 0
            even += 1
        else
            odd += 1
        end
    end
    [even, odd].min
end
