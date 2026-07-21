from collections import defaultdict


class Solution(object):
    def displayTable(self, orders):
        """
        :type orders: List[List[str]]
        :rtype: List[List[str]]
        """
        food_items = set()
        table_orders = defaultdict(lambda: defaultdict(int))

        for customer, table, food in orders:
            food_items.add(food)
            table_orders[int(table)][food] += 1

        sorted_food_items = sorted(food_items)
        header = ["Table"] + sorted_food_items

        result = [header]
        for table in sorted(table_orders):
            row = [str(table)]
            for food in sorted_food_items:
                row.append(str(table_orders[table][food]))
            result.append(row)

        return result
