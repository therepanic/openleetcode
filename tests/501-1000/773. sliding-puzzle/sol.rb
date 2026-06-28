# @param {Integer[][]} board
# @return {Integer}
def sliding_puzzle(board)
    target = "123450"
    start = board.flatten.join
    
    neighbors = {
        0 => [1, 3], 1 => [0, 2, 4], 2 => [1, 5],
        3 => [0, 4], 4 => [1, 3, 5], 5 => [2, 4]
    }
    
    queue = [[start, 0]]
    visited = Set.new
    visited.add(start)
    
    while !queue.empty?
        state, moves = queue.shift
        
        return moves if state == target
        
        zero_index = state.index('0')
        
        neighbors[zero_index].each do |neighbor|
            new_state = state.dup
            new_state[zero_index], new_state[neighbor] = new_state[neighbor], new_state[zero_index]
            
            unless visited.include?(new_state)
                visited.add(new_state)
                queue.push([new_state, moves + 1])
            end
        end
    end
    
    return -1
end
