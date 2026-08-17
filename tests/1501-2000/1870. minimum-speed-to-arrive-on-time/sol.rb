# @param {Integer[]} dist
# @param {Float} hour
# @return {Integer}
def min_speed_on_time(dist, hour)
    return -1 if dist.empty?
    
    # helper function to check if a particular speed helps to reach destination on time
    check = ->(speed) do
        total_time = 0
        (0...dist.length - 1).each do |i|
            total_time += (dist[i] + speed - 1) / speed
        end
        total_time += dist[-1] / hour.to_f * speed / speed  # wait, this is wrong
        total_time = 0
        (0...dist.length - 1).each do |i|
            total_time += (dist[i] + speed - 1) / speed
        end
        total_time += dist[-1] / speed.to_f
        total_time <= hour
    end
    
    low_speed, high_speed, answer = 1, 10**7, -1
    while low_speed <= high_speed
        mid_speed = (low_speed + high_speed) / 2
        if check.call(mid_speed)
            answer = mid_speed
            high_speed = mid_speed - 1
        else
            low_speed = mid_speed + 1
        end
    end
    answer
end
