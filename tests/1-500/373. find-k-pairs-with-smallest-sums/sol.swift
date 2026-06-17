class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        if nums1.isEmpty || nums2.isEmpty {
            return []
        }

        var h = [(Int, Int, Int)]()
        h.append((nums1[0] + nums2[0], 0, 0))
        var visited = Set<[Int]>()
        visited.insert([0, 0])
        var result = [[Int]]()

        while !h.isEmpty && result.count < k {
            h.sort {
                if $0.0 != $1.0 { return $0.0 < $1.0 }
                if $0.1 != $1.1 { return $0.1 < $1.1 }
                return $0.2 < $1.2
            }
            let (_, i, j) = h.removeFirst()
            result.append([nums1[i], nums2[j]])

            if j + 1 < nums2.count && !visited.contains([i, j + 1]) {
                visited.insert([i, j + 1])
                h.append((nums1[i] + nums2[j + 1], i, j + 1))
            }

            if i + 1 < nums1.count && !visited.contains([i + 1, j]) {
                visited.insert([i + 1, j])
                h.append((nums1[i + 1] + nums2[j], i + 1, j))
            }
        }

        return result
    }
}
