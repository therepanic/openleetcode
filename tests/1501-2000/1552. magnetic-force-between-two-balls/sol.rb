# @param {Integer[]} position
# @param {Integer} m
# @return {Integer}
def max_distance(position, m)
    position.sort!
    right = position[-1] - position[0]
    left = 1
    
    while left <= right
        mid = (left + right) / 2
        my_balls = 1
        previous = position[0]
        
        position[1..-1].each do |places|
            if places - previous >= mid
                my_balls += 1
                previous = places
            end
        end
        
        if my_balls >= m
            left = mid + 1
        else
            right = mid - 1
        end
    end
    
    right
end
