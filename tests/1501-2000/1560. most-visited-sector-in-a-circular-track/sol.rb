# @param {Integer} n
# @param {Integer[]} rounds
# @return {Integer[]}
def most_visited(n, rounds)
    s, e = rounds[0], rounds[-1]
    if s <= e
        (s..e).to_a
    else
        (1..e).to_a + (s..n).to_a
    end
end
