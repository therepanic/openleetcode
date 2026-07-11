# @param {Integer[][]} trips
# @param {Integer} capacity
# @return {Boolean}
def car_pooling(trips, capacity)
    trips.sort_by! { |trip| trip[1] }
    heap = []
    current_passengers = 0
    trips.each do |num, src, dest|
        while !heap.empty? && heap[0][0] <= src
            current_passengers -= heap.shift[1]
        end
        if current_passengers + num > capacity
            return false
        end
        current_passengers += num
        heap.push([dest, num])
        heap.sort_by! { |h| h[0] }
    end
    true
end
