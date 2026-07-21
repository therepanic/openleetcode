class Solution {
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var vc: [(Int, Int)] = []
        for i in lo...hi {
            var num = i
            var count = 0
            while num != 1 {
                if num % 2 == 0 {
                    num /= 2
                } else {
                    num = 3 * num + 1
                }
                count += 1
            }
            vc.append((i, count))
        }
        vc.sort {
            if $0.1 != $1.1 {
                return $0.1 < $1.1
            }
            return $0.0 < $1.0
        }
        return vc[k - 1].0
    }
}
