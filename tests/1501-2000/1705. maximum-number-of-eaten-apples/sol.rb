# @param {Integer[]} apples
# @param {Integer[]} days
# @return {Integer}
def eaten_apples(apples, days)
    heap = []
    n = apples.length
    res = 0
    day = 0
    while !heap.empty? || day < n
        if day < n && apples[day] > 0
            heap << [day + days[day], apples[day]]
            heap.sort!
        end
        while !heap.empty? && heap[0][0] <= day
            heap.shift
        end
        if !heap.empty?
            expire, count = heap.shift
            res += 1
            count -= 1
            if count > 0
                heap << [expire, count]
                heap.sort!
            end
        end
        day += 1
    end
    res
end
