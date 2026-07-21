func displayTable(orders [][]string) [][]string {
    foodItems := make(map[string]bool)
    tableOrders := make(map[int]map[string]int)

    for _, order := range orders {
        table, _ := strconv.Atoi(order[1])
        food := order[2]
        foodItems[food] = true
        if tableOrders[table] == nil {
            tableOrders[table] = make(map[string]int)
        }
        tableOrders[table][food]++
    }

    sortedFoodItems := make([]string, 0, len(foodItems))
    for food := range foodItems {
        sortedFoodItems = append(sortedFoodItems, food)
    }
    sort.Strings(sortedFoodItems)

    header := []string{"Table"}
    header = append(header, sortedFoodItems...)

    result := [][]string{header}

    sortedTables := make([]int, 0, len(tableOrders))
    for table := range tableOrders {
        sortedTables = append(sortedTables, table)
    }
    sort.Ints(sortedTables)

    for _, table := range sortedTables {
        row := []string{strconv.Itoa(table)}
        for _, food := range sortedFoodItems {
            row = append(row, strconv.Itoa(tableOrders[table][food]))
        }
        result = append(result, row)
    }

    return result
}
