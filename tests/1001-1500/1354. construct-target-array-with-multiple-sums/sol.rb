# @param {Integer[]} target
# @return {Boolean}
def is_possible(target)
    total = target.sum
    heap = target.map { |x| -x }
    heap.sort!
    while true
        largest = -heap.shift
        rest = total - largest
        if largest == 1 || rest == 1
            return true
        end
        if rest == 0 || rest >= largest
            return false
        end
        previous = largest % rest
        if previous == 0
            return false
        end
        total = rest + previous
        heap << -previous
        heap.sort!
    end
end
