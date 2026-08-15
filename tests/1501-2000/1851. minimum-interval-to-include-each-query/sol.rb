# @param {Integer[][]} intervals
# @param {Integer[]} queries
# @return {Integer[]}
def min_interval(intervals, queries)
    intervals.sort!
    min_heap = []
    res = {}
    i = 0
    sorted_queries = queries.sort
    sorted_queries.each do |q|
        while i < intervals.length && intervals[i][0] <= q
            l, r = intervals[i]
            min_heap << [r - l + 1, r]
            i += 1
        end
        min_heap.sort!
        while !min_heap.empty? && min_heap[0][1] < q
            min_heap.shift
        end
        res[q] = min_heap.empty? ? -1 : min_heap[0][0]
    end
    queries.map! { |q| res[q] }
    queries
end
