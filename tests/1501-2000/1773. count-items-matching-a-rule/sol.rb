# @param {String[][]} items
# @param {String} rule_key
# @param {String} rule_value
# @return {Integer}
def count_matches(items, rule_key, rule_value)
    key_map={"type"=>0,"color"=>1,"name"=>2}
    count=0
    idx=key_map[rule_key]
    items.each do |item|
        if item[idx]==rule_value
            count+=1
        end
    end
    return count
end
