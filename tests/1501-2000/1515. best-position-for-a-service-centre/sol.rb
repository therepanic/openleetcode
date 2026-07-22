# @param {Integer[][]} positions
# @return {Float}
def get_min_dist_sum(positions)
    fn = ->(x, y) {
        positions.sum { |xx, yy| Math.sqrt((x - xx)**2 + (y - yy)**2) }
    }
    
    x = positions.sum { |p| p[0] }.to_f / positions.length
    y = positions.sum { |p| p[1] }.to_f / positions.length
    
    ans = fn.call(x, y)
    chg = 100.0
    while chg > 1e-6
        zoom = true
        [[-1, 0], [0, -1], [0, 1], [1, 0]].each do |dx, dy|
            xx = x + chg * dx
            yy = y + chg * dy
            dd = fn.call(xx, yy)
            if dd < ans
                ans = dd
                x, y = xx, yy
                zoom = false
                break
            end
        end
        chg /= 2 if zoom
    end
    ans
end
