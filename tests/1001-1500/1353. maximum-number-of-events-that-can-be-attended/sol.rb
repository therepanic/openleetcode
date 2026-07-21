# @param {Integer[][]} events
# @return {Integer}
require 'algorithms'
def max_events(events)
    events.sort_by! { |e| e[0] }
    min_heap = Containers::MinHeap.new
    day = 0
    i = 0
    n = events.length
    result = 0
    
    while !min_heap.empty? || i < n
        if min_heap.empty?
            day = events[i][0]
        end
        while i < n && events[i][0] <= day
            min_heap.push(events[i][1])
            i += 1
        end
        min_heap.pop
        result += 1
        day += 1
        while !min_heap.empty? && min_heap.next < day
            min_heap.pop
        end
    end
    result
end
