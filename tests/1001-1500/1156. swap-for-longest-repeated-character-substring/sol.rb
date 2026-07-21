# @param {String} text
# @return {Integer}
def max_rep_opt1(text)
  total = Hash.new(0)
  text.each_char { |c| total[c] += 1 }
  n = text.length
  ans = 0
  
  total.keys.each do |ch|
    left = 0
    count = 0
    
    (0...n).each do |right|
      if text[right] == ch
        count += 1
      end
      
      while (right - left + 1) - count > 1
        if text[left] == ch
          count -= 1
        end
        left += 1
      end
      
      ans = [ans, [right - left + 1, total[ch]].min].max
    end
  end
  
  ans
end
