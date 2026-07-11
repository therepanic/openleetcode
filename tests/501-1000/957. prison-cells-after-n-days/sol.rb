# @param {Integer[]} cells
# @param {Integer} n
# @return {Integer[]}
def prison_after_n_days(cells, n)
    n = (n - 1) % 14 + 1
    n.times do
        prev = cells[0]
        (1...(cells.length - 1)).each do |i|
            current = cells[i]
            if prev == cells[i + 1]
                cells[i] = 1
            else
                cells[i] = 0
            end
            prev = current
        end
        cells[0] = 0
        cells[-1] = 0
    end
    cells
end
