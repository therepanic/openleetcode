# @param {Integer[][]} points
# @param {Integer} angle
# @param {Integer[]} location
# @return {Integer}
def visible_points(points, angle, location)
    same = 0
    angles = []
    x0, y0 = location
    
    points.each do |p|
        dx = p[0] - x0
        dy = p[1] - y0
        if dx == 0 && dy == 0
            same += 1
            next
        end
        ang = Math.atan2(dy, dx) * 180.0 / Math::PI
        angles << ang
    end
    
    return same if angles.empty?
    
    angles.sort!
    n = angles.length
    full = angles + angles.map { |a| a + 360 }
    
    max_vis = 0
    j = 0
    (0...n).each do |i|
        while j < full.length && full[j] - full[i] <= angle
            j += 1
        end
        max_vis = [max_vis, j - i].max
    end
    
    max_vis + same
end
