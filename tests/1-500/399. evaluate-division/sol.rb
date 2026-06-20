# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
    g = {}
    equations.each_with_index do |eq, i|
        a, b = eq
        v = values[i]
        g[a] ||= {}
        g[a][b] = v
        g[b] ||= {}
        g[b][a] = 1.0 / v
    end
    
    def dfs(g, x, y)
        return -1.0 if !g.key?(x) || !g.key?(y)
        s = [[x, 1.0]]
        visited = {}
        while !s.empty?
            c, r = s.pop
            return r if c == y
            visited[c] = true
            g[c].each do |n, w|
                unless visited.key?(n)
                    s.push([n, r * w])
                end
            end
        end
        -1.0
    end
    
    queries.map { |a, b| dfs(g, a, b) }
end
