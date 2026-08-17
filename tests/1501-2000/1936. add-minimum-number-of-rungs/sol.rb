# @param {Integer[]} rungs
# @param {Integer} dist
# @return {Integer}
def add_rungs(rungs, dist)
    curr = 0
    res = 0
    rungs.each do |rung|
        if rung - curr > dist
            res += (rung - curr - 1) / dist
        end
        curr = rung
    end
    res
end
