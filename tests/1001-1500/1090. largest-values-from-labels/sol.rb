# @param {Integer[]} values
# @param {Integer[]} labels
# @param {Integer} num_wanted
# @param {Integer} use_limit
# @return {Integer}
def largest_vals_from_labels(values, labels, num_wanted, use_limit)
    n = values.length
    pairs = (0...n).map { |i| [values[i], labels[i]] }
    pairs.sort_by! { |x| -x[0] }
    res = 0
    freq = {}
    pairs.each do |value, label|
        break if num_wanted == 0
        if !freq.key?(label) || freq[label] < use_limit
            res += value
            freq[label] = (freq[label] || 0) + 1
            num_wanted -= 1
        end
    end
    res
end
