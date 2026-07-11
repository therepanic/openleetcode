# @param {Integer[]} commands
# @param {Integer[][]} obstacles
# @return {Integer}
def robot_sim(commands, obstacles)
    blocked = Set.new
    obstacles.each do |o|
        blocked.add([o[0], o[1]])
    end

    directions = [
        [0, 1], [1, 0], [0, -1], [-1, 0]
    ]

    x = 0
    y = 0
    dir = 0
    max_dist = 0

    commands.each do |cmd|
        if cmd == -1
            dir = (dir + 1) % 4
        elsif cmd == -2
            dir = (dir + 3) % 4
        else
            while cmd > 0
                nx = x + directions[dir][0]
                ny = y + directions[dir][1]

                if blocked.include?([nx, ny])
                    break
                end

                x = nx
                y = ny

                max_dist = [max_dist, x * x + y * y].max
                cmd -= 1
            end
        end
    end

    return max_dist
end
