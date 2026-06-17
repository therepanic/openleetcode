# @param {Integer} x
# @param {Integer} y
# @param {Integer} target
# @return {Boolean}
def can_measure_water(x, y, target)
    return false if target > x + y
    stack = [[0, 0]]
    visited = Set.new
    while !stack.empty?
        a, b = stack.pop
        return true if a + b == target
        next if visited.include?([a, b])
        visited.add([a, b])
        stack.push([x, b], [a, y], [0, b], [a, 0])
        w = [a, y - b].min
        stack.push([a - w, b + w])
        w = [b, x - a].min
        stack.push([a + w, b - w])
    end
    false
end
