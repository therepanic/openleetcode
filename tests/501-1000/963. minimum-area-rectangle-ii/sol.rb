# @param {Integer[][]} points
# @return {Float}
def min_area_free_rect(points)
    ans = Float::INFINITY
    seen = {}
    points.each_with_index do |(x0, y0), i|
        points[i+1..].each do |x1, y1|
            cx = (x0 + x1) / 2.0
            cy = (y0 + y1) / 2.0
            d2 = (x0 - x1)**2 + (y0 - y1)**2
            key = [cx, cy, d2]
            if seen.key?(key)
                seen[key].each do |xx, yy|
                    area = Math.sqrt(((x0 - xx)**2 + (y0 - yy)**2) * ((x1 - xx)**2 + (y1 - yy)**2))
                    ans = area if area < ans
                end
            end
            seen[key] ||= []
            seen[key] << [x0, y0]
        end
    end
    ans == Float::INFINITY ? 0.0 : ans
end
