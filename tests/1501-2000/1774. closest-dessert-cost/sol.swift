class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var s = [0]
        for i in toppingCosts {
            var ss = [Int]()
            for j in s {
                ss += [j, j+i, j+2*i]
            }
            s = ss
        }
        s.sort()
        var ans = 1000000000
        var fans = 1000000000
        let n = s.count
        for i in baseCosts {
            let j = target - i
            var x = s.binarySearch(j)
            if x < 0 { x = -x - 2 }
            x = max(x, 0)
            var ans1 = abs(j - s[x])
            if ans1 < ans {
                ans = ans1
                fans = s[x] + i
            } else if ans1 == ans {
                fans = min(fans, s[x] + i)
            }
            if x + 1 < n {
                x += 1
                ans1 = abs(j - s[x])
                if ans1 < ans {
                    ans = ans1
                    fans = s[x] + i
                } else if ans1 == ans {
                    fans = min(fans, s[x] + i)
                }
            }
        }
        return fans
    }
}

extension Array where Element: Comparable {
    func binarySearch(_ element: Element) -> Int {
        var low = 0, high = count - 1
        while low <= high {
            let mid = (low + high) / 2
            if self[mid] == element {
                return mid
            } else if self[mid] < element {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return -low - 1
    }
}
