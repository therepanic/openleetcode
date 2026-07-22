# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def max_abs_val_expr(arr1, arr2)
    res = 0
    n = arr1.length

    [[1, 1], [1, -1], [-1, 1], [-1, -1]].each do |p, q|
        max_val = -Float::INFINITY
        min_val = Float::INFINITY
        (0...n).each do |i|
            value = p * arr1[i] + q * arr2[i] + i
            max_val = value if value > max_val
            min_val = value if value < min_val
        end
        res = [res, max_val - min_val].max
    end

    res
end
