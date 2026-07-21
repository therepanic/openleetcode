def sort_items(n, m, group, before_items)
    group_to_items = Hash.new { |h, k| h[k] = [] }
    new_group = m
    (0...n).each do |item|
        if group[item] == -1
            group[item] = new_group
            new_group += 1
        end
        group_to_items[group[item]] << item
    end

    intra_pred = Hash.new { |h, k| h[k] = Set.new }
    intra_succ = Hash.new { |h, k| h[k] = Set.new }
    inter_pred = Hash.new { |h, k| h[k] = Set.new }
    inter_succ = Hash.new { |h, k| h[k] = Set.new }

    (0...n).each do |item|
        before_items[item].each do |before|
            if group[item] == group[before]
                intra_pred[item].add(before)
                intra_succ[before].add(item)
            else
                inter_pred[group[item]].add(group[before])
                inter_succ[group[before]].add(group[item])
            end
        end
    end

    def topological_sort(nodes, pred, succ)
        order = []
        no_pred = nodes.select { |node| pred[node].empty? }
        while !no_pred.empty?
            node = no_pred.shift
            order << node
            succ[node].each do |s|
                pred[s].delete(node)
                if pred[s].empty?
                    no_pred << s
                end
            end
        end
        order.length == nodes.length ? order : []
    end

    groups_order = topological_sort(group_to_items.keys, inter_pred, inter_succ)
    return [] if groups_order.empty?

    items_order = []
    groups_order.each do |grp|
        order = topological_sort(group_to_items[grp], intra_pred, intra_succ)
        return [] if order.empty?
        items_order.concat(order)
    end
    items_order
end
