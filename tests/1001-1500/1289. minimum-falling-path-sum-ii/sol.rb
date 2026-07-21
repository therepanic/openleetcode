# @param {Integer[][]} grid
# @return {Integer}
def min_falling_path_sum(grid)
    dp = grid[0].dup
    (1...grid.length).each do |i|
        smallest = Float::INFINITY
        second_smallest = Float::INFINITY
        smallest_col = -1
        dp.each_with_index do |value, col|
            if value < smallest
                second_smallest = smallest
                smallest = value
                smallest_col = col
            elsif value < second_smallest
                second_smallest = value
            end
        end
        dp = grid[i].each_with_index.map do |value, col|
            value + (col == smallest_col ? second_smallest : smallest)
        end
    end
    dp.min
end
