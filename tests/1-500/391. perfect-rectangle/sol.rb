# @param {Integer[][]} rectangles
# @return {Boolean}
def is_rectangle_cover(rectangles)
    area = 0
    corners = Set.new
    
    rectangles.each do |x, y, x2, y2|
        area += (x2 - x) * (y2 - y)
        corners ^= Set.new([[x, y], [x, y2], [x2, y], [x2, y2]])
    end
    
    return false if corners.size != 4
    
    x_vals = corners.map { |c| c[0] }
    y_vals = corners.map { |c| c[1] }
    x = x_vals.min
    y = y_vals.min
    x2 = x_vals.max
    y2 = y_vals.max
    
    return (x2 - x) * (y2 - y) == area
end

def isRectangleCover(rectangles)
    is_rectangle_cover(rectangles)
end
