# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
    count = 0
    grid.each do |row|
        row.each do |num|
            count += 1 if num < 0
        end
    end
    count
end
