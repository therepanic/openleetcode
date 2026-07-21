# @param {Integer[][]} grid
# @param {Integer} k
# @return {Integer[][]}
def shift_grid(grid, k)
    m = grid.length - 1
    n = grid[0].length - 1
    total = (m + 1) * (n + 1)
    k %= total
    return grid if k == 0
    
    last_k_elements = []
    i = m
    x = n
    count = 0
    
    while count != k
        last_k_elements << grid[i][x]
        if x >= 1
            x -= 1
        else
            i -= 1
            x = n
        end
        count += 1
    end
    
    j = m
    y = n
    
    while i != 0 || x != -1
        if x == -1
            i -= 1
            x = n
        end
        if y == -1
            j -= 1
            y = n
        end
        grid[j][y] = grid[i][x]
        x -= 1
        y -= 1
    end
    
    idx = 0
    while k > 0
        if y == -1
            j -= 1
            y = n
        end
        grid[j][y] = last_k_elements[idx]
        y -= 1
        k -= 1
        idx += 1
    end
    
    grid
end
