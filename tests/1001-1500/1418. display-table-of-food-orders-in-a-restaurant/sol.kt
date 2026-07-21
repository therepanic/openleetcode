class Solution {
    fun displayTable(orders: Array<Array<String>>): List<List<String>> {
        return displayTable(orders.map { it.toList() })
    }

    fun displayTable(orders: List<List<String>>): List<List<String>> {
        val foodItems = mutableSetOf<String>()
        val tableOrders = mutableMapOf<Int, MutableMap<String, Int>>()

        for ((_, table, food) in orders) {
            foodItems.add(food)
            val t = table.toInt()
            tableOrders.getOrPut(t) { mutableMapOf() }
                       .merge(food, 1, Int::plus)
        }

        val sortedFoodItems = foodItems.toList().sorted()
        val header = mutableListOf("Table")
        header.addAll(sortedFoodItems)

        val result = mutableListOf<List<String>>()
        result.add(header)

        for (table in tableOrders.keys.sorted()) {
            val row = mutableListOf(table.toString())
            val tableMap = tableOrders[table]!!
            for (food in sortedFoodItems) {
                row.add((tableMap[food] ?: 0).toString())
            }
            result.add(row)
        }

        return result
    }
}
