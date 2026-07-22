class Solution {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        var foodItems = Set<String>()
        var tableOrders = [Int: [String: Int]]()

        for order in orders {
            let table = Int(order[1])!
            let food = order[2]
            foodItems.insert(food)
            tableOrders[table, default: [:]][food, default: 0] += 1
        }

        let sortedFoodItems = foodItems.sorted()
        var header = ["Table"]
        header.append(contentsOf: sortedFoodItems)

        var result = [[String]]()
        result.append(header)

        for table in tableOrders.keys.sorted() {
            var row = [String(table)]
            let tableMap = tableOrders[table]!
            for food in sortedFoodItems {
                row.append(String(tableMap[food] ?? 0))
            }
            result.append(row)
        }

        return result
    }
}
