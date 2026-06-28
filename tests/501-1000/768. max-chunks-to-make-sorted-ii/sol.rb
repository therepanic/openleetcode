# @param {Integer[]} arr
# @return {Integer}
def max_chunks_to_sorted(arr)
    n = arr.length
    min_right = Array.new(n, 0)
    current_min = Float::INFINITY
    (n - 1).downto(0) do |i|
        current_min = arr[i] if arr[i] < current_min
        min_right[i] = current_min
    end
    
    chunks = 0
    current_max = -Float::INFINITY
    (0...n - 1).each do |i|
        current_max = arr[i] if arr[i] > current_max
        chunks += 1 if current_max <= min_right[i + 1]
    end
    chunks + 1
end
