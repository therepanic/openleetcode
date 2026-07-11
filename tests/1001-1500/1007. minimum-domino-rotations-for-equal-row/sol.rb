# @param {Integer[]} tops
# @param {Integer[]} bottoms
# @return {Integer}
def min_domino_rotations(tops, bottoms)
    n = tops.length
    res = Float::INFINITY
    face = Array.new(7, 0)
    (0...n).each do |i|
        face[tops[i]] += 1
        if bottoms[i] != tops[i]
            face[bottoms[i]] += 1
        end
    end
    (1..6).each do |x|
        if face[x] < n
            next
        end
        maintain_top = 0
        maintain_bottom = 0
        possible = true
        (0...n).each do |i|
            if tops[i] != x
                maintain_top += 1
            end
            if bottoms[i] != x
                maintain_bottom += 1
            end
        end
        if possible
            res = [res, maintain_top, maintain_bottom].min
        end
    end
    res == Float::INFINITY ? -1 : res
end
