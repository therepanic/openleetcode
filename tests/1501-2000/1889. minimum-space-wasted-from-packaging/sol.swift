class Solution {
    func minWastedSpace(_ packages: [Int], _ boxes: [[Int]]) -> Int {
        let sortedPackages = packages.sorted()
        let n = sortedPackages.count
        let totalPackageSum = sortedPackages.reduce(0, +)
        
        var minGrossArea = Int.max
        
        for var supplierBoxes in boxes {
            supplierBoxes.sort()
            if supplierBoxes.last! < sortedPackages[n - 1] { continue }
            
            var grossArea = 0
            var lowIdx = 0
            
            for b in supplierBoxes {
                let highIdx = upperBound(sortedPackages, b, lowIdx)
                let count = highIdx - lowIdx
                if count > 0 {
                    grossArea += b * count
                    lowIdx = highIdx
                }
                if lowIdx == n { break }
            }
            
            minGrossArea = min(minGrossArea, grossArea)
        }
        
        if minGrossArea == Int.max { return -1 }
        return (minGrossArea - totalPackageSum) % 1_000_000_007
    }
    
    private func upperBound(_ arr: [Int], _ target: Int, _ lo: Int) -> Int {
        var l = lo
        var h = arr.count
        while l < h {
            let mid = l + (h - l) / 2
            if arr[mid] <= target { l = mid + 1 }
            else { h = mid }
        }
        return l
    }
}
