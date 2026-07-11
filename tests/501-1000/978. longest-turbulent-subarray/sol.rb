# @param {Integer[]} arr
# @return {Integer}
def max_turbulence_size(arr)
    n = arr.length
    return n if n < 2

    ans = 1
    anchor = 0

    compare = ->(x, y) {
        if x < y
            -1
        elsif x > y
            1
        else
            0
        end
    }

    (1...n).each do |i|
        c = compare.call(arr[i - 1], arr[i])
        if c == 0
            anchor = i
        else
            if i == n - 1 || c * compare.call(arr[i], arr[i + 1]) != -1
                ans = [ans, i - anchor + 1].max
                anchor = i
            end
        end
    end
    ans
end
