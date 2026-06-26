# @param {Integer[]} p1
# @param {Integer[]} p2
# @param {Integer[]} p3
# @param {Integer[]} p4
# @return {Boolean}
def valid_square(p1, p2, p3, p4)
    def get_dist_sq(pt1, pt2)
        (pt1[0] - pt2[0])**2 + (pt1[1] - pt2[1])**2
    end
    
    points = [p1, p2, p3, p4]
    distances = Set.new
    
    (0...4).each do |i|
        (i+1...4).each do |j|
            distances.add(get_dist_sq(points[i], points[j]))
        end
    end
    
    distances.length == 2 && !distances.include?(0)
end
