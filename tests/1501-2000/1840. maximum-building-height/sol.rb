# @param {Integer} n
# @param {Integer[][]} restrictions
# @return {Integer}
def max_building(n, restrictions)
    restrictions << [1, 0]
    restrictions.sort!
    m = restrictions.length
    
    y_cap = ->(x1, y1, x2, y2) { [y2, y1 + (x2 - x1).abs].min }
    y_peak = ->(x1, y1, x2, y2) { (y1 + y2 + x2 - x1) >> 1 }
    
    (1...m).each do |i|
        restrictions[i][1] = y_cap.call(restrictions[i-1][0], restrictions[i-1][1], restrictions[i][0], restrictions[i][1])
    end
    
    (m-2).downto(0) do |i|
        restrictions[i][1] = y_cap.call(restrictions[i+1][0], restrictions[i+1][1], restrictions[i][0], restrictions[i][1])
    end
    
    res = 0
    (1...m).each do |i|
        res = [res, y_peak.call(restrictions[i-1][0], restrictions[i-1][1], restrictions[i][0], restrictions[i][1])].max
    end
    
    [res, restrictions[-1][1] + n - restrictions[-1][0]].max
end
