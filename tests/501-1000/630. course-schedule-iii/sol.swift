class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let sorted = courses.sorted { a, b in
            a[1] == b[1] ? a[0] < b[0] : a[1] < b[1]
        }
        var heap = Heap<Int>(sort: >)
        var days = 0
        for course in sorted {
            let duration = course[0]
            let last = course[1]
            days += duration
            heap.insert(duration)
            if days > last {
                let top = heap.remove()!
                days -= top
            }
        }
        return heap.count
    }
}

struct Heap<Element> {
    var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.sort = sort
        self.elements = []
    }
    
    var count: Int { elements.count }
    
    mutating func insert(_ value: Element) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> Element? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeLast()
        }
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        return value
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
