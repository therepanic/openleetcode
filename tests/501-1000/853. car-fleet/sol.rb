# @param {Integer} target
# @param {Integer[]} position
# @param {Integer[]} speed
# @return {Integer}
def car_fleet(target, position, speed)
    cars = position.zip(speed).sort_by { |p, s| -p }
    stack = []
    cars.each do |p, s|
        t = (target - p).to_f / s
        if stack.empty? || t > stack.last
            stack << t
        end
    end
    stack.length
end
