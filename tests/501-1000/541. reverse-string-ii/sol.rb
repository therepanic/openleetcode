# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
    arr = s.chars
    step = 2 * k
    (0...arr.length).step(step) do |i|
        start = i
        end_idx = [i + k - 1, arr.length - 1].min
        while start < end_idx
            arr[start], arr[end_idx] = arr[end_idx], arr[start]
            start += 1
            end_idx -= 1
        end
    end
    arr.join
end
