# @param {String} s
# @return {Integer}
def min_swaps(s)
    count0 = s.count('0')
    count1 = s.count('1')
    
    return -1 if (count0 - count1).abs > 1
    
    mismatch = ->(start_char) {
        mismatches = 0
        s.each_char.with_index do |ch, i|
            expected = i.even? ? start_char : (start_char == '0' ? '1' : '0')
            mismatches += 1 if ch != expected
        end
        mismatches / 2
    }
    
    if count0 == count1
        [mismatch.call('0'), mismatch.call('1')].min
    elsif count0 > count1
        mismatch.call('0')
    else
        mismatch.call('1')
    end
end
