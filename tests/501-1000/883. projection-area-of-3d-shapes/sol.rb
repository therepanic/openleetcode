# @param {Integer[][]} grid
# @return {Integer}
def projection_area(grid)
    xy_area = grid.flatten.count { |val| val > 0 }
    yz_area = grid.sum { |row| row.max }
    zx_area = grid.transpose.sum { |col| col.max }
    xy_area + yz_area + zx_area
end
