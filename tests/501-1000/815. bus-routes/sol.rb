# @param {Integer[][]} routes
# @param {Integer} source
# @param {Integer} target
# @return {Integer}
def num_buses_to_destination(routes, source, target)
    return 0 if source == target
    adj = Hash.new { |h, k| h[k] = Set.new }
    routes.each_with_index do |locations, bus|
        locations.each do |location|
            adj[location].add(bus)
        end
    end
    queue = adj[target].to_a
    cost = 0
    visited = Set.new
    while !queue.empty?
        cost += 1
        queue.size.times do
            node = queue.shift
            visited.add(node)
            return cost if routes[node].include?(source)
            routes[node].each do |location|
                adj[location].each do |bus|
                    queue.push(bus) unless visited.include?(bus)
                end
            end
        end
    end
    -1
end
