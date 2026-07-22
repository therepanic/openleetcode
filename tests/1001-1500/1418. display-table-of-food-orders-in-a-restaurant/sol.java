class Solution {
    public List<List<String>> displayTable(String[][] orders) {
        List<List<String>> converted = new ArrayList<>();
        for (String[] order : orders) {
            converted.add(Arrays.asList(order));
        }
        return displayTable(converted);
    }

    public List<List<String>> displayTable(List<List<String>> orders) {
        Set<String> foodItems = new HashSet<>();
        Map<Integer, Map<String, Integer>> tableOrders = new HashMap<>();

        for (List<String> order : orders) {
            String food = order.get(2);
            int table = Integer.parseInt(order.get(1));
            foodItems.add(food);
            tableOrders.computeIfAbsent(table, k -> new HashMap<>())
                       .merge(food, 1, Integer::sum);
        }

        List<String> sortedFoodItems = new ArrayList<>(foodItems);
        Collections.sort(sortedFoodItems);
        List<String> header = new ArrayList<>();
        header.add("Table");
        header.addAll(sortedFoodItems);

        List<List<String>> result = new ArrayList<>();
        result.add(header);

        List<Integer> sortedTables = new ArrayList<>(tableOrders.keySet());
        Collections.sort(sortedTables);

        for (int table : sortedTables) {
            List<String> row = new ArrayList<>();
            row.add(String.valueOf(table));
            Map<String, Integer> tableMap = tableOrders.get(table);
            for (String food : sortedFoodItems) {
                row.add(String.valueOf(tableMap.getOrDefault(food, 0)));
            }
            result.add(row);
        }

        return result;
    }
}
