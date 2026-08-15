# @param {Integer[]} code
# @param {Integer} k
# @return {Integer[]}
def decrypt(code, k)
    n = code.length
    result = Array.new(n, 0)
    
    return result if k == 0

    window = k.abs
    total = 0

    start = k > 0 ? 1 : n - window
    end_idx = k > 0 ? window : n - 1

    (start..end_idx).each do |i|
        total += code[i % n]
    end
    n.times do |i|
        result[i] = total

        total -= code[start % n]
        start += 1

        end_idx += 1
        total += code[end_idx % n]
    end
    result
end
