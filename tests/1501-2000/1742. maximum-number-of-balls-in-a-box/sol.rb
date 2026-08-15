# @param {Integer} low_limit
# @param {Integer} high_limit
# @return {Integer}
def count_balls(low_limit, high_limit)
    box_count = Hash.new(0)
    max_balls = 0
    (low_limit..high_limit).each do |num|
        box = num.to_s.chars.map(&:to_i).sum
        box_count[box] += 1
        max_balls = [max_balls, box_count[box]].max
    end
    max_balls
end
