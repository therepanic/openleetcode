# @param {Integer[]} slices
# @return {Integer}
def max_size_slices(slices)
    n = slices.length
    m = n / 3

    dp = lambda do |slices_subset|
        k = slices_subset.length
        dp_table = Array.new(k + 1) { Array.new(m + 1, 0) }
        (1..k).each do |i|
            (1..[i, m].min).each do |j|
                take = (i > 1 ? dp_table[i - 2][j - 1] : 0) + slices_subset[i - 1]
                dp_table[i][j] = [dp_table[i - 1][j], take].max
            end
        end
        dp_table[k][m]
    end

    [dp.call(slices[0...-1]), dp.call(slices[1..-1])].max
end
