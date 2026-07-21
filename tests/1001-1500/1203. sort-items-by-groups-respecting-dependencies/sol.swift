class Solution {
    func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
        var group = group
        var groupToItems = [Int: Set<Int>]()
        var newGroup = m
        for i in 0..<n {
            if group[i] == -1 {
                group[i] = newGroup
                newGroup += 1
            }
            groupToItems[group[i], default: []].insert(i)
        }
        
        var intraPred = [Int: Set<Int>]()
        var intraSucc = [Int: Set<Int>]()
        var interPred = [Int: Set<Int>]()
        var interSucc = [Int: Set<Int>]()
        
        for i in 0..<n {
            for before in beforeItems[i] {
                if group[i] == group[before] {
                    intraPred[i, default: []].insert(before)
                    intraSucc[before, default: []].insert(i)
                } else {
                    interPred[group[i], default: []].insert(group[before])
                    interSucc[group[before], default: []].insert(group[i])
                }
            }
        }
        
        func topoSort(_ nodes: Set<Int>, _ pred: inout [Int: Set<Int>], _ succ: [Int: Set<Int>]) -> [Int] {
            var order = [Int]()
            var queue = [Int]()
            for node in nodes {
                if pred[node]?.isEmpty ?? true { queue.append(node) }
            }
            while !queue.isEmpty {
                let node = queue.removeFirst()
                order.append(node)
                for s in succ[node] ?? [] {
                    pred[s]?.remove(node)
                    if pred[s]?.isEmpty ?? true { queue.append(s) }
                }
            }
            return order.count == nodes.count ? order : []
        }
        
        let groupsOrder = topoSort(Set(groupToItems.keys), &interPred, interSucc)
        if groupsOrder.isEmpty { return [] }
        
        var result = [Int]()
        for grp in groupsOrder {
            let order = topoSort(groupToItems[grp]!, &intraPred, intraSucc)
            if order.isEmpty { return [] }
            result.append(contentsOf: order)
        }
        return result
    }
}
