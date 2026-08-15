# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def maximum_score(a, b, c)
    [a + b + c - [a, b, c].max, (a + b + c) / 2].min
end
