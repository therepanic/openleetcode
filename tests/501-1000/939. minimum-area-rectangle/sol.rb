# @param {Integer[][]} points
# @return {Integer}
def min_area_rect(points)
    cols = {}
    points.each do |x, y|
        cols[x] = [] unless cols.key?(x)
        cols[x] << y
    end
    
    last_x = {}
    best = Float::INFINITY
    cols.keys.sort.each do |x|
        ys = cols[x].sort
        (0...ys.length).each do |i|
            ((i + 1)...ys.length).each do |j|
                pair = [ys[i], ys[j]]
                if last_x.key?(pair)
                    best = [best, (x - last_x[pair]) * (ys[j] - ys[i])].min
                end
                last_x[pair] = x
            end
        end
    end
    best == Float::INFINITY ? 0 : best
end
