# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} indices
# @return {Integer}
def odd_cells(m, n, indices)
    a = []
    c = 0
    (0...m).each do |i|
        l = []
        (0...n).each do |j|
            l.append(0)
        end
        a.append(l)
    end
    indices.each do |k|
        (0...n).each do |u|
            a[k[0]][u] += 1
        end
        (0...m).each do |l|
            a[l][k[1]] += 1
        end
    end
    a.each do |i|
        i.each do |j|
            if j % 2 != 0
                c += 1
            end
        end
    end
    return c
end
