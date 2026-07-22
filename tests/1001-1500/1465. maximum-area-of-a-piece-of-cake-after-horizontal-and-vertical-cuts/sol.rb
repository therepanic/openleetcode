# @param {Integer} h
# @param {Integer} w
# @param {Integer[]} horizontal_cuts
# @param {Integer[]} vertical_cuts
# @return {Integer}
def max_area(h, w, horizontal_cuts, vertical_cuts)
    mod = 10**9 + 7
    
    horizontal_cuts.sort!
    vertical_cuts.sort!
    
    max_h = [horizontal_cuts[0], h - horizontal_cuts[-1]].max
    (1...horizontal_cuts.length).each do |i|
        max_h = [max_h, horizontal_cuts[i] - horizontal_cuts[i - 1]].max
    end
    
    max_v = [vertical_cuts[0], w - vertical_cuts[-1]].max
    (1...vertical_cuts.length).each do |i|
        max_v = [max_v, vertical_cuts[i] - vertical_cuts[i - 1]].max
    end
    
    (max_h * max_v) % mod
end
