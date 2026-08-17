# @param {Integer} n
# @return {Integer}
def two_egg_drop(n)
    l, r = 1, n
    res = nil
    while l <= r
        moves = (l + r) / 2
        if (1 + moves) * moves / 2 >= n
            res = moves
            r = moves - 1
        else
            l = moves + 1
        end
    end
    res
end
