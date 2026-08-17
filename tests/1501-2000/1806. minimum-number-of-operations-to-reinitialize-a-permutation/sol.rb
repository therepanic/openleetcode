# @param {Integer} n
# @return {Integer}
def reinitialize_permutation(n)
    original = (0...n).to_a
    permut = original.dup
    arr = Array.new(n, 0)
    count = 0
    loop do
        (0...n).each do |i|
            if i % 2 == 0
                arr[i] = permut[i / 2]
            else
                arr[i] = permut[n / 2 + (i - 1) / 2]
            end
        end
        permut = arr.dup
        count += 1
        break if permut == original
    end
    count
end
