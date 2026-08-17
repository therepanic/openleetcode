using System.Collections.Generic;
using System.Linq;

public class Solution {
    public int GetNumberOfBacklogOrders(int[][] orders) {
        var buy = new SortedDictionary<int, int>(Comparer<int>.Create((a,b) => b.CompareTo(a)));
        var sell = new SortedDictionary<int, int>();
        foreach (var order in orders) {
            int price = order[0], amount = order[1], type = order[2];
            if (type == 0) {
                while (sell.Count > 0 && sell.First().Key <= price) {
                    var s = sell.First();
                    if (amount >= s.Value) {
                        amount -= s.Value;
                        sell.Remove(s.Key);
                    } else {
                        sell[s.Key] = s.Value - amount;
                        amount = 0;
                        break;
                    }
                }
            } else {
                while (buy.Count > 0 && buy.First().Key >= price) {
                    var b = buy.First();
                    if (amount >= b.Value) {
                        amount -= b.Value;
                        buy.Remove(b.Key);
                    } else {
                        buy[b.Key] = b.Value - amount;
                        amount = 0;
                        break;
                    }
                }
            }
            if (amount > 0) {
                if (type == 0) {
                    if (buy.ContainsKey(price)) buy[price] += amount;
                    else buy[price] = amount;
                } else {
                    if (sell.ContainsKey(price)) sell[price] += amount;
                    else sell[price] = amount;
                }
            }
        }
        long res = 0;
        foreach (var kv in buy) res += kv.Value;
        foreach (var kv in sell) res += kv.Value;
        return (int)(res % 1000000007);
    }
}
