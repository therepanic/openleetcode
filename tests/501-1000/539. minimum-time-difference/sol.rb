# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
    convert = ->(time) {
        h, m = time.split(':').map(&:to_i)
        h * 60 + m
    }
    
    times = time_points.map { |t| convert.call(t) }.sort
    min_diff = Float::INFINITY
    (1...times.length).each do |i|
        min_diff = [min_diff, times[i] - times[i - 1]].min
    end
    min_diff = [min_diff, 1440 + times[0] - times[-1]].min
    min_diff
end
