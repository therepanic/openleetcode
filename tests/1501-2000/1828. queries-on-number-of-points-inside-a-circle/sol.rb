# @param {Integer[][]} points
# @param {Integer[][]} queries
# @return {Integer[]}
def count_points(points, queries)
    b = Array.new(queries.length, 0)
    (0...queries.length).each do |i|
        (0...points.length).each do |j|
            if ((queries[i][0]-points[j][0])**2 + (queries[i][1]-points[j][1])**2) <= queries[i][2]**2
                b[i] += 1
            end
        end
    end
    b
end
