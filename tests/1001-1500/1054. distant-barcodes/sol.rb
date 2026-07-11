# @param {Integer[]} barcodes
# @return {Integer[]}
def rearrange_barcodes(barcodes)
    h = Hash.new(0)
    barcodes.each { |i| h[i] += 1 }
    heap = []
    l = []
    h.each { |k, v| heap.push([-v, k]) }
    heap.sort_by! { |a| a[0] }
    while heap.length > 1
        x = heap.shift
        y = heap.shift
        l.push(x[1])
        l.push(y[1])
        x[0] += 1
        y[0] += 1
        unless x[0] == 0
            heap.push(x)
            heap.sort_by! { |a| a[0] }
        end
        unless y[0] == 0
            heap.push(y)
            heap.sort_by! { |a| a[0] }
        end
    end
    l.push(heap[0][1]) unless heap.empty?
    l
end
