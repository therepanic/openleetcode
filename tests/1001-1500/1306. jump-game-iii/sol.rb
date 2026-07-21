# @param {Integer[]} arr
# @param {Integer} start
# @return {Boolean}
def can_reach(arr, start)
    seen = Set.new
    queue = [start]
    head = 0
    while head < queue.length
        index = queue[head]
        head += 1
        if index < 0 or index >= arr.length or seen.include?(index)
            next
        end
        if arr[index] == 0
            return true
        end
        seen.add(index)
        queue.push(index + arr[index])
        queue.push(index - arr[index])
    end
    return false
end
