# @param {String[][]} orders
# @return {String[][]}
def display_table(orders)
    food_items = Set.new
    table_orders = Hash.new { |h, k| h[k] = Hash.new(0) }

    orders.each do |customer, table, food|
        food_items.add(food)
        table_orders[table.to_i][food] += 1
    end

    sorted_food_items = food_items.to_a.sort
    header = ["Table"] + sorted_food_items

    result = [header]
    table_orders.keys.sort.each do |table|
        row = [table.to_s]
        sorted_food_items.each do |food|
            row << table_orders[table][food].to_s
        end
        result << row
    end

    result
end
