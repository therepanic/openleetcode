# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
    n = citations.length
    l = 0
    r = n
    while l < r
        m = (l + r + 1) / 2
        if citations[n - m] >= m
            l = m
        else
            r = m - 1
        end
    end
    l
end
