# @param {Integer[][]} intervals
# @return {Integer}
def remove_covered_intervals(intervals)
    intervals.sort_by! { |a| [a[0], -a[1]] }
    res = 0
    r = 0
    intervals.each do |st, en|
        if en > r
            res += 1
        end
        r = [r, en].max
    end
    res
end
