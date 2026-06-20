# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
    g.sort!
    s.sort!
    i = 0
    j = 0
    count = 0
    while i < g.length && j < s.length
        if s[j] >= g[i]
            count += 1
            i += 1
        end
        j += 1
    end
    count
end
