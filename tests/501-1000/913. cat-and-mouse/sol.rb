# @param {Integer[][]} graph
# @return {Integer}
def cat_mouse_game(graph)
    mouse_turn = 0
    cat_turn = 1
    mouse_win = 1
    cat_win = 2
    draw = 0
    
    n = graph.length
    results = {}
    (1...n).each do |i|
        results[[0, i, cat_turn]] = mouse_win
        results[[0, i, mouse_turn]] = mouse_win
        results[[i, i, cat_turn]] = cat_win
        results[[i, i, mouse_turn]] = cat_win
    end
    
    degree = {}
    (1...n).each do |mouse|
        (1...n).each do |cat|
            degree[[mouse, cat, mouse_turn]] = graph[mouse].length
            degree[[mouse, cat, cat_turn]] = graph[cat].length - (graph[cat].include?(0) ? 1 : 0)
        end
    end
    
    q = results.keys
    
    until q.empty?
        state = q.shift
        mouse, cat, turn = state
        cur_result = results[state]
        
        prev_states = []
        if turn == mouse_turn
            graph[cat].each do |prev_cat|
                prev_states << [mouse, prev_cat, cat_turn]
            end
        else
            graph[mouse].each do |prev_mouse|
                prev_states << [prev_mouse, cat, mouse_turn]
            end
        end
        
        prev_states.each do |prev_state|
            next if results.key?(prev_state)
            prev_mouse, prev_cat, prev_turn = prev_state
            next if prev_cat == 0
            
            degree[prev_state] -= 1
            is_mover_winner = ((cur_result == mouse_win && prev_turn == mouse_turn) ||
                               (cur_result == cat_win && prev_turn == cat_turn))
            if is_mover_winner || degree[prev_state] == 0
                results[prev_state] = cur_result
                q.push(prev_state)
            end
        end
    end
    
    results.fetch([1, 2, mouse_turn], draw)
end
