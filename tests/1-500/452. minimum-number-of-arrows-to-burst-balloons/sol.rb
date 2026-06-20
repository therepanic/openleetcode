# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
    points.sort_by! { |p| p[1] }
    arrows = 1
    end_val = points[0][1]
    points.each do |start, finish|
        if start > end_val
            arrows += 1
            end_val = finish
        end
    end
    arrows
end
