class Solution {
    func isTransformable(_ s: String, _ t: String) -> Bool {
        if Array(s).sorted() != Array(t).sorted() { return false }
        
        var pos = [[Int]](repeating: [], count: 10)
        for (i, ch) in s.enumerated() {
            pos[Int(String(ch))!].append(i)
        }
            
        for ch in t {
            let dig = Int(String(ch))!
            let i = pos[dig].removeFirst()
            for ii in 0..<dig {
                if !pos[ii].isEmpty && pos[ii][0] < i { return false }
            }
        }
        return true
    }
}
