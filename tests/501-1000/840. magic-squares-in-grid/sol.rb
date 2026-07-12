# @param {Integer[][]} grid
# @return {Integer}
def num_magic_squares_inside(grid)
    is_magic_square = lambda do |grid, r, c|
        return false if grid[r+1][c+1] != 5

        a = grid[r][c]; b = grid[r][c+1]; d = grid[r][c+2]
        e = grid[r+1][c]; f = grid[r+1][c+2]
        h = grid[r+2][c]; i = grid[r+2][c+1]; j = grid[r+2][c+2]

        seen = Array.new(10, false)
        arr = [a,b,d,e,f,h,i,j,5]
        arr.each do |x|
            return false if x < 1 || x > 9 || seen[x]
            seen[x] = true
        end

        return false if a + j != 10
        return false if b + i != 10
        return false if d + h != 10
        return false if e + f != 10

        return false if a + b + d != 15
        return false if h + i + j != 15
        return false if a + e + h != 15
        return false if d + f + j != 15
        return false if a + 5 + j != 15
        return false if d + 5 + h != 15

        true
    end

    m = grid.length; n = grid[0].length; c = 0
    (0...m-2).each do |i|
        (0...n-2).each do |j|
            c += 1 if is_magic_square.call(grid, i, j)
        end
    end
    c
end
