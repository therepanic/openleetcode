public class Solution {
    public IList<IList<string>> DisplayTable(IList<IList<string>> orders) {
        var foodItems = new SortedSet<string>();
        var tableOrders = new SortedDictionary<int, Dictionary<string, int>>();

        foreach (var order in orders) {
            int table = int.Parse(order[1]);
            string food = order[2];
            foodItems.Add(food);
            if (!tableOrders.ContainsKey(table)) {
                tableOrders[table] = new Dictionary<string, int>();
            }
            if (tableOrders[table].ContainsKey(food)) {
                tableOrders[table][food]++;
            } else {
                tableOrders[table][food] = 1;
            }
        }

        var header = new List<string> { "Table" };
        header.AddRange(foodItems);

        var result = new List<IList<string>> { header };

        foreach (var kvp in tableOrders) {
            var row = new List<string> { kvp.Key.ToString() };
            foreach (var food in foodItems) {
                kvp.Value.TryGetValue(food, out int count);
                row.Add(count.ToString());
            }
            result.Add(row);
        }

        return result;
    }
}
