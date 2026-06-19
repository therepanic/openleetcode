# @param {Integer[][]} points
# @return {Integer}
def number_of_boomerangs(points)
    result = 0
    points.each do |p|
        distances = Hash.new(0)
        points.each do |q|
            d = (p[0] - q[0])**2 + (p[1] - q[1])**2
            distances[d] += 1
        end
        distances.each_value do |count|
            result += count * (count - 1)
        end
    end
    result
end
