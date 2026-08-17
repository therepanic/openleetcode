# @param {Integer[][]} towers
# @param {Integer} radius
# @return {Integer[]}
def best_coordinate(towers, radius)
    max_x = towers.map { |t| t[0] }.max
    max_y = towers.map { |t| t[1] }.max
    
    best_quality = 0
    best_coord = [0, 0]
    
    (0..max_x).each do |x|
        (0..max_y).each do |y|
            quality = 0
            towers.each do |tx, ty, q|
                dist = Math.sqrt((tx - x) ** 2 + (ty - y) ** 2)
                if dist <= radius
                    quality += (q / (1 + dist)).to_i
                end
            end
            if quality > best_quality || (quality == best_quality && (x < best_coord[0] || (x == best_coord[0] && y < best_coord[1])))
                best_quality = quality
                best_coord = [x, y]
            end
        end
    end
    
    best_coord
end
