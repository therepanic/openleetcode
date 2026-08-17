# @param {Integer[][]} tasks
# @return {Integer}
def minimum_effort(tasks)
    tasks.sort_by! { |cost, thresh| -(thresh - cost) }
    test = ->(bal) {
        tasks.each do |cost, thresh|
            return false if bal < thresh
            bal -= cost
        end
        true
    }
    lo, hi = 0, 10**9 + 1
    while lo < hi
        mid = (lo + hi) / 2
        if test.call(mid)
            hi = mid
        else
            lo = mid + 1
        end
    end
    lo
end
