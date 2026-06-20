# @param {Integer[]} time_series
# @param {Integer} duration
# @return {Integer}
def find_poisoned_duration(time_series, duration)
    total_secs = 0
    prev = nil

    time_series.each do |t|
        total_secs += duration

        if !prev.nil? && prev + duration > t
            total_secs -= (prev + duration - t)
        end

        prev = t
    end

    total_secs
end
