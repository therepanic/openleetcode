# @param {Integer[][]} coordinates
# @return {Boolean}
def check_straight_line(coordinates)
    x1, y1 = coordinates[0]
    x2, y2 = coordinates[1]
    
    if x2 == x1
        slope = Float::INFINITY
    else
        slope = (y2 - y1).to_f / (x2 - x1)
    end
    
    n = coordinates.length
    (1...n - 1).each do |i|
        x1, y1 = coordinates[i]
        x2, y2 = coordinates[i + 1]
        
        if x2 == x1
            curr_slope = Float::INFINITY
        else
            curr_slope = (y2 - y1).to_f / (x2 - x1)
        end
        
        return false if curr_slope != slope
    end
    
    true
end
