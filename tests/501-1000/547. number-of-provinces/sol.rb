# @param {Integer[][]} is_connected
# @return {Integer}
def find_circle_num(is_connected)
    n = is_connected.length
    visited = Array.new(n, false)
    count = 0

    dfs = lambda do |city|
        (0...n).each do |neighbor|
            if is_connected[city][neighbor] == 1 && !visited[neighbor]
                visited[neighbor] = true
                dfs.call(neighbor)
            end
        end
    end

    (0...n).each do |city|
        unless visited[city]
            visited[city] = true
            dfs.call(city)
            count += 1
        end
    end

    count
end
