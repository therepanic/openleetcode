class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        var resultOrs = Set<Int>()
        var currentOrs = Set<Int>()
        
        for x in arr {
            var nextOrs = Set<Int>()
            for y in currentOrs {
                nextOrs.insert(x | y)
            }
            nextOrs.insert(x)
            resultOrs.formUnion(nextOrs)
            currentOrs = nextOrs
        }
        
        return resultOrs.count
    }
}
