# @param {Integer[][]} intervals
# @return {Integer[]}
def find_right_interval(intervals)
    starts = intervals.each_with_index.map { |interval, i| [interval[0], i] }
    starts.sort_by! { |s| s[0] }
    res = []
    intervals.each do |interval|
        end_val = interval[1]
        left = 0
        right = starts.length - 1
        idx = -1
        while left <= right
            mid = (left + right) / 2
            if starts[mid][0] >= end_val
                idx = starts[mid][1]
                right = mid - 1
            else
                left = mid + 1
            end
        end
        res << idx
    end
    res
end
