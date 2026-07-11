# @param {String} instructions
# @return {Boolean}
def is_robot_bounded(instructions)
    directions = [[0,1], [1,0], [0,-1], [-1,0]]
    x, y, dir_index = 0, 0, 0
    
    instructions.each_char do |instr|
        if instr == 'G'
            x += directions[dir_index][0]
            y += directions[dir_index][1]
        elsif instr == 'L'
            dir_index = (dir_index - 1) % 4
        elsif instr == 'R'
            dir_index = (dir_index + 1) % 4
        end
    end
    
    return (x == 0 && y == 0) || dir_index != 0
end
