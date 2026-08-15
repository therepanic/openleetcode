# @param {Integer[][]} points
# @return {Integer}
def max_width_of_vertical_area(points)
    max_width = 0
    points.sort_by! { |p| p[0] }
    (0...points.length-1).each do |i|
        width = points[i+1][0] - points[i][0]
        max_width = [max_width, width].max
    end
    max_width
end
