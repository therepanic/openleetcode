# @param {Integer} n
# @return {Integer}
def total_money(n)
    arithmeticProgression = ->(leading, last, terms) { (leading+last)*terms/2 }
    q, r = n.divmod(7)
    arithmeticProgression.call(28, 28+(q-1)*7, q) + arithmeticProgression.call(q+1, q+r, r)
end
