# @param {Integer[][]} edges
# @return {Integer}
def find_center(edges)
    a, b = edges[0]
    c, d = edges[1]
    if a == c || a == d
        return a
    end
    b
end
