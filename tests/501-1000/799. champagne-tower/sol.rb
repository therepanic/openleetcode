# @param {Integer} poured
# @param {Integer} query_row
# @param {Integer} query_glass
# @return {Float}
def champagne_tower(poured, query_row, query_glass)
    tower = Array.new(102) { Array.new(102, 0.0) }
    tower[0][0] = poured
    
    (0..query_row).each do |r|
        (0..r).each do |c|
            if tower[r][c] > 1
                excess = (tower[r][c] - 1.0) / 2.0
                tower[r][c] = 1
                tower[r+1][c] += excess
                tower[r+1][c+1] += excess
            end
        end
    end
    
    tower[query_row][query_glass]
end
