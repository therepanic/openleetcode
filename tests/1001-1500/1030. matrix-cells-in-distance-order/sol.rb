# @param {Integer} rows
# @param {Integer} cols
# @param {Integer} r_center
# @param {Integer} c_center
# @return {Integer[][]}
def all_cells_dist_order(rows, cols, r_center, c_center)
    (0...rows).to_a.product((0...cols).to_a).sort_by { |r, c| [(r - r_center).abs + (c - c_center).abs, r, c] }
end
