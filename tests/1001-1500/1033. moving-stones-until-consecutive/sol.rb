# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer[]}
def num_moves_stones(a, b, c)
    x, y, z = [a, b, c].sort
    min_move = if z - x == 2
                 0
               elsif y - x <= 2 || z - y <= 2
                 1
               else
                 2
               end
    max_move = z - x - 2
    [min_move, max_move]
end
