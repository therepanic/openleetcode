# @param {Integer[]} houses
# @param {Integer[]} heaters
# @return {Integer}
def find_radius(houses, heaters)
    houses.sort!
    heaters.sort!
    radius = 0
    houses.each do |house|
        left, right = 0, heaters.length - 1
        while left < right
            mid = (left + right) / 2
            if heaters[mid] < house
                left = mid + 1
            else
                right = mid
            end
        end
        dist = (heaters[left] - house).abs
        if left > 0
            dist = [dist, (heaters[left - 1] - house).abs].min
        end
        radius = [radius, dist].max
    end
    radius
end
