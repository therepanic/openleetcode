# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
    n = edges.length
    matrix = Array.new(n + 1) { [] }
    edges.each do |a, b|
        matrix[a] << b
        matrix[b] << a
    end

    visited = Set.new
    path = Set.new
    cycle_start = -1

    dfs = lambda do |i, parent|
        return false if visited.include?(i)
        visited.add(i)
        matrix[i].each do |node|
            if !visited.include?(node)
                if dfs.call(node, i)
                    if cycle_start != -1
                        path.add(node)
                    end
                    if node == cycle_start
                        cycle_start = -1
                    end
                    return true
                end
            elsif node != parent
                path.add(node)
                cycle_start = node
                return true
            end
        end
        false
    end

    (n).downto(1) do |i|
        break if dfs.call(i, -1)
    end

    (n - 1).downto(0) do |k|
        a, b = edges[k]
        return [a, b] if path.include?(a) && path.include?(b)
    end
end
