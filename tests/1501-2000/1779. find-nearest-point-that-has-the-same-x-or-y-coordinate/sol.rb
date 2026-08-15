# @param {Integer} x
# @param {Integer} y
# @param {Integer[][]} points
# @return {Integer}
def nearest_valid_point(x, y, points)
    current_min_distance = 20001
    current_min_index = -1
    points.each_with_index do |point, i|
        a, b = point
        if x == a || y == b
            distance = (x - a).abs + (y - b).abs
            if distance < current_min_distance
                current_min_distance = distance
                current_min_index = i
            end
        end
    end
    current_min_index
end
