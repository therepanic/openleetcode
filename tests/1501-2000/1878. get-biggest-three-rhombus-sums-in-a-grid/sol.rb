# @param {Integer[][]} grid
# @return {Integer[]}
def get_biggest_three(grid)
    m = grid.length
    n = grid[0].length
    max_d = [m, n].min / 2
    result = []
    
    (0..max_d).each do |d|
        (d...(m-d)).each do |i|
            (d...(n-d)).each do |j|
                val = diamond_sum(grid, i, j, d)
                result << val unless result.include?(val)
            end
        end
    end
    result.sort.reverse.first(3)
end

def diamond_sum(grid, i, j, d)
    return grid[i][j] if d == 0
    sum = 0
    (0..d).each { |t| sum += grid[i - d + t][j + t] }
    (1..d).each { |t| sum += grid[i + t][j + d - t] }
    (1..d).each { |t| sum += grid[i + d - t][j - t] }
    (1...d).each { |t| sum += grid[i - t][j - d + t] }
    sum
end
