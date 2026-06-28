# @param {Integer[][]} intervals
# @return {Integer}
def intersection_size_two(intervals)
    intervals.sort_by! { |l, r| [r, -l] }
    ans = 0
    a = -1
    b = -1
    intervals.each do |l, r|
        if l > b
            a = r - 1
            b = r
            ans += 2
        elsif l > a
            a = b
            b = r
            ans += 1
        end
    end
    ans
end
