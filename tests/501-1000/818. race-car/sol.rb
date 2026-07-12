# @param {Integer} target
# @return {Integer}
def racecar(target)
    require 'set'
    q = [[0, 1, 0]]
    while !q.empty?
        cp, cs, nm = q.shift
        return nm if cp == target
        q.push([cp + cs, cs * 2, nm + 1])
        if (cp + cs > target && cs > 0) || (cp + cs < target && cs < 0)
            if cs < 0
                q.push([cp, 1, nm + 1])
            else
                q.push([cp, -1, nm + 1])
            end
        end
    end
end
