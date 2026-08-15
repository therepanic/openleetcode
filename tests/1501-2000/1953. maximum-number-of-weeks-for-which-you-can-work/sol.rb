# @param {Integer[]} milestones
# @return {Integer}
def number_of_weeks(milestones)
    total = milestones.sum
    max_val = milestones.max
    if max_val <= total - max_val
        total
    else
        2 * (total - max_val) + 1
    end
end
