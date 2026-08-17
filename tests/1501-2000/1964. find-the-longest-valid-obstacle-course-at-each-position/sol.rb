# @param {Integer[]} obstacles
# @return {Integer[]}
def longest_obstacle_course_at_each_position(obstacles)
    tails = []
    res = []
    obstacles.each do |x|
        idx = tails.bsearch_index { |t| t > x } || tails.length
        if idx == tails.length
            tails << x
        else
            tails[idx] = x
        end
        res << idx + 1
    end
    res
end
