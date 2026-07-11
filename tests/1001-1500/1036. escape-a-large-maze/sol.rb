# @param {Integer[][]} blocked
# @param {Integer[]} source
# @param {Integer[]} target
# @return {Boolean}
def is_escape_possible(blocked, source, target)
    blocked_set = blocked.map { |b| [b[0], b[1]] }.to_set
    max = blocked.length * blocked.length

    bfs = lambda do |start, finish|
        visited = Set.new
        queue = [start]
        visited.add(start)
        count = 0

        while !queue.empty?
            x, y = queue.shift
            return true if [x, y] == finish
            return true if count > max

            [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dx, dy|
                nx = x + dx
                ny = y + dy
                if nx >= 0 && nx < 10**6 && ny >= 0 && ny < 10**6 && !visited.include?([nx, ny]) && !blocked_set.include?([nx, ny])
                    visited.add([nx, ny])
                    queue.push([nx, ny])
                end
            end
            count += 1
        end

        false
    end

    bfs.call(source, target) && bfs.call(target, source)
end
