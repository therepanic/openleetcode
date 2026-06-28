# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
def find_cheapest_price(n, flights, src, dst, k)
    matrix = Hash.new { |h, key| h[key] = [] }
    flights.each do |u, v, w|
        matrix[u] << [v, w]
    end

    distance = Array.new(n, Float::INFINITY)
    distance[src] = 0

    queue = [[src, 0]]
    steps = 0
    while !queue.empty?
        level = queue.size
        if steps == k + 1
            break
        end
        steps += 1

        level.times do
            node, dist = queue.shift
            neighbors = matrix[node]
            next if neighbors.nil?
            neighbors.each do |v, w|
                if w + dist < distance[v]
                    distance[v] = w + dist
                    queue.push([v, dist + w])
                end
            end
        end
    end

    distance[dst] == Float::INFINITY ? -1 : distance[dst]
end
