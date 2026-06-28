# @param {Integer[][]} forest
# @return {Integer}
def cut_off_tree(forest)
    rows = forest.length
    cols = forest[0].length
    
    return -1 if forest[0][0] == 0
    
    def find_shortest_path(forest, start_row, start_col, target_row, target_col, rows, cols)
        queue = [[start_row, start_col, 0]]
        visited = Set.new
        visited.add([start_row, start_col])
        directions = [[-1, 0], [0, -1], [0, 1], [1, 0]]
        
        until queue.empty?
            current_row, current_col, steps = queue.shift
            
            if current_row == target_row && current_col == target_col
                return steps
            end
            
            directions.each do |delta_row, delta_col|
                new_row = current_row + delta_row
                new_col = current_col + delta_col
                
                if new_row >= 0 && new_row < rows && new_col >= 0 && new_col < cols &&
                   forest[new_row][new_col] > 0 && !visited.include?([new_row, new_col])
                    queue.push([new_row, new_col, steps + 1])
                    visited.add([new_row, new_col])
                end
            end
        end
        
        return -1
    end
    
    require 'set'
    tree_heap = []
    for row in 0...rows
        for col in 0...cols
            if forest[row][col] > 1
                tree_heap.push([forest[row][col], row, col])
            end
        end
    end
    
    tree_heap.sort_by! { |h, r, c| h }
    
    total_steps = 0
    current_row, current_col = 0, 0
    
    tree_heap.each do |tree_height, target_row, target_col|
        steps_to_tree = find_shortest_path(forest, current_row, current_col, target_row, target_col, rows, cols)
        
        return -1 if steps_to_tree == -1
        
        total_steps += steps_to_tree
        current_row, current_col = target_row, target_col
    end
    
    total_steps
end
