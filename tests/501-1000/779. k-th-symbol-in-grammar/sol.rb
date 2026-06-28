# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
    return 0 if n == 1
    parent = kth_grammar(n - 1, (k + 1) / 2)
    k % 2 == 1 ? parent : 1 - parent
end
