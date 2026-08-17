class Solution {
    func getNumberOfBacklogOrders(_ orders: [[Int]]) -> Int {
        var buy = [(Int, Int)]()
        var sell = [(Int, Int)]()
        for order in orders {
            let price = order[0]
            var amount = order[1]
            let type = order[2]
            if type == 0 {
                while !sell.isEmpty && sell[0].0 <= price {
                    let s = sell.removeFirst()
                    if amount >= s.1 {
                        amount -= s.1
                    } else {
                        sell.insert((s.0, s.1 - amount), at: 0)
                        amount = 0
                        break
                    }
                }
            } else {
                while !buy.isEmpty && -buy[0].0 >= price {
                    let b = buy.removeFirst()
                    if amount >= b.1 {
                        amount -= b.1
                    } else {
                        buy.insert((b.0, b.1 - amount), at: 0)
                        amount = 0
                        break
                    }
                }
            }
            if amount > 0 {
                if type == 0 {
                    buy.insert((-price, amount), at: 0)
                    buy.sort { $0.0 < $1.0 }
                } else {
                    sell.insert((price, amount), at: 0)
                    sell.sort { $0.0 < $1.0 }
                }
            }
        }
        var res = 0
        for x in buy { res += x.1 }
        for x in sell { res += x.1 }
        return res % 1_000_000_007
    }
}
