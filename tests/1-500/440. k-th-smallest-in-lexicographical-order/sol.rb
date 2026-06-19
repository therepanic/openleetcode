# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(n, k)
    solve(0, n, k)
end

def solve(current, n, k)
    return current / 10 if k == 0

    start = [current, 1].max
    (start...current + 10).each do |i|
        count = num_of_children(i, i + 1, n)
        if count >= k
            return solve(i * 10, n, k - 1)
        end
        k -= count
    end

    -1
end

def num_of_children(current, neighbour, n)
    if neighbour > n
        return 0 if current > n
        return n - current + 1
    end
    (neighbour - current) + num_of_children(current * 10, neighbour * 10, n)
end
