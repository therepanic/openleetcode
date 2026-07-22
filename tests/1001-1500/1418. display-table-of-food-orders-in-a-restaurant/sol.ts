function displayTable(orders: string[][]): string[][] {
  const foodItems = new Set<string>();
  const tableOrders = new Map<number, Map<string, number>>();

  for (const [, tableStr, food] of orders) {
    const table = parseInt(tableStr, 10);
    foodItems.add(food);
    if (!tableOrders.has(table)) {
      tableOrders.set(table, new Map());
    }
    const foodMap = tableOrders.get(table)!;
    foodMap.set(food, (foodMap.get(food) || 0) + 1);
  }

  const sortedFoodItems = Array.from(foodItems).sort();
  const header = ["Table", ...sortedFoodItems];

  const result: string[][] = [header];
  const sortedTables = Array.from(tableOrders.keys()).sort((a, b) => a - b);

  for (const table of sortedTables) {
    const row: string[] = [table.toString()];
    const foodMap = tableOrders.get(table)!;
    for (const food of sortedFoodItems) {
      row.push((foodMap.get(food) || 0).toString());
    }
    result.push(row);
  }

  return result;
}
