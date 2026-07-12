# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
    indegree = Array.new(n + 1, 0)
    outdegree = Array.new(n + 1, 0)
    trust.each do |a, b|
        outdegree[a] += 1
        indegree[b] += 1
    end
    (1..n).each do |i|
        return i if outdegree[i] == 0 && indegree[i] == n - 1
    end
    -1
end
