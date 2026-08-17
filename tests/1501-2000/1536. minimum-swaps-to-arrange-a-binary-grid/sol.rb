# @param {Integer[][]} grid
# @return {Integer}
def min_swaps(grid)
    n = grid.size
    zeros = []
    grid.each do |row|
        count = 0
        (n-1).downto(0) do |j|
            if row[j] == 0
                count += 1
            else
                break
            end
        end
        zeros << count
    end
    swaps = 0
    (0...n).each do |i|
        needed = n - i - 1
        j = i
        while j < n && zeros[j] < needed
            j += 1
        end
        return -1 if j == n
        while j > i
            zeros[j], zeros[j-1] = zeros[j-1], zeros[j]
            j -= 1
            swaps += 1
        end
    end
    swaps
end
