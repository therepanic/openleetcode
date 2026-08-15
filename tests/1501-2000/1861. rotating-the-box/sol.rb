def rotate_the_box(box_grid)
    r = box_grid.length
    c = box_grid[0].length
    rotate = Array.new(c) { Array.new(r, '.') }
    (0...r).each do |i|
        bottom = c - 1
        (c - 1).downto(0) do |j|
            if box_grid[i][j] == '#'
                rotate[bottom][r - 1 - i] = '#'
                bottom -= 1
            elsif box_grid[i][j] == '*'
                rotate[j][r - 1 - i] = '*'
                bottom = j - 1
            end
        end
    end
    rotate
end
