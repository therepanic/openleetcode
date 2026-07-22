# @param {Integer[][]} grid
# @return {Integer}
def largest1_bordered_square(grid)
    m = grid.size
    n = grid[0].size
    h = Array.new(m) { Array.new(n, 0) }
    v = Array.new(m) { Array.new(n, 0) }
    (0...m).each do |i|
        (0...n).each do |j|
            if grid[i][j] == 1
                h[i][j] = j == 0 ? 1 : h[i][j-1] + 1
                v[i][j] = i == 0 ? 1 : v[i-1][j] + 1
            end
        end
    end
    ans = 0
    (0...m).each do |i|
        (0...n).each do |j|
            sz = [h[i][j], v[i][j]].min
            (1..sz).reverse_each do |k|
                if h[i-k+1][j] >= k && v[i][j-k+1] >= k
                    ans = [ans, k].max
                    break
                end
            end
        end
    end
    ans * ans
end
