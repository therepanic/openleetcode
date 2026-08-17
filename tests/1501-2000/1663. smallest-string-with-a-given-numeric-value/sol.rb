# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_smallest_string(n, k)
    res = Array.new(n, 'a')
    k -= n

    i = n - 1
    while k > 0
        add = [25, k].min
        res[i] = ('a'.ord + add).chr
        k -= add
        i -= 1
    end

    res.join
end
