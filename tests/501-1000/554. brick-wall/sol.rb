# @param {Integer[][]} wall
# @return {Integer}
def least_bricks(wall)
    edge_counts = {}
    wall.each do |row|
        edge = 0
        row[0...-1].each do |brick|
            edge += brick
            edge_counts[edge] = (edge_counts[edge] || 0) + 1
        end
    end
    max_edges = edge_counts.empty? ? 0 : edge_counts.values.max
    wall.length - max_edges
end
