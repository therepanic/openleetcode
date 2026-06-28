# @param {Integer[][]} ghosts
# @param {Integer[]} target
# @return {Boolean}
def escape_ghosts(ghosts, target)
    moves = ->(x, y) {
        (x[0] - y[0]).abs + (x[1] - y[1]).abs
    }
    
    a = []
    ghosts.each do |i|
        a.append(moves.call(i, target))
    end
    
    z = moves.call(target, [0, 0])
    
    ans = true
    a.each do |i|
        if i <= z
            ans = false
        end
    end
    
    ans
end
