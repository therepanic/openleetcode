# @param {Integer[]} heights
# @param {Integer} bricks
# @param {Integer} ladders
# @return {Integer}
def furthest_building(heights, bricks, ladders)
    require 'algorithms'
    heap = Containers::MinHeap.new
    n = heights.length
    (1...n).each do |i|
        climb = heights[i] - heights[i-1]
        next if climb <= 0
        heap.push(climb)
        if heap.size > ladders
            diff = heap.pop
            if bricks >= diff
                bricks -= diff
            else
                return i-1
            end
        end
    end
    n-1
end
