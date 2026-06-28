# @param {Integer[][]} trees
# @return {Integer[][]}
def outer_trees(trees)
    return trees if trees.length == 1

    def cross(o, a, b)
        (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])
    end

    trees.sort!

    lower = []
    trees.each do |p|
        while lower.length >= 2 && cross(lower[-2], lower[-1], p) < 0
            lower.pop
        end
        lower.push(p)
    end

    upper = []
    trees.reverse.each do |p|
        while upper.length >= 2 && cross(upper[-2], upper[-1], p) < 0
            upper.pop
        end
        upper.push(p)
    end

    full_hull = lower[0...-1] + upper[0...-1]
    full_hull.uniq
end
