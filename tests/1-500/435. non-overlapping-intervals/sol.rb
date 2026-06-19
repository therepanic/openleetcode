# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
    return 0 if intervals.empty?
    intervals.sort_by! { |i| i[1] }
    count = 0
    end_val = intervals[0][1]
    (1...intervals.length).each do |i|
        if end_val > intervals[i][0]
            count += 1
        else
            end_val = intervals[i][1]
        end
    end
    count
end
