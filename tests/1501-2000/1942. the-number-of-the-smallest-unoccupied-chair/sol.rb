# @param {Integer[][]} times
# @param {Integer} target_friend
# @return {Integer}
def smallest_chair(times, target_friend)
    target_time = times[target_friend]
    times.sort!

    n = times.length
    chair_time = Array.new(n, 0)

    times.each do |time|
        (0...n).each do |i|
            if chair_time[i] <= time[0]
                chair_time[i] = time[1]
                if time == target_time
                    return i
                end
                break
            end
        end
    end

    0
end
