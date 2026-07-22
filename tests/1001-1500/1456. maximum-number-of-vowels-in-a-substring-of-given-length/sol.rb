# @param {String} s
# @param {Integer} k
# @return {Integer}
def is_vowel(c)
  'aeiou'.include?(c)
end

def max_vowels(s, k)
  max_vowel = 0
  left = 0
  vowel = 0
  
  (0...s.length).each do |right|
    if is_vowel(s[right])
      vowel += 1
    end
    
    if (right - left + 1) == k
      max_vowel = [max_vowel, vowel].max
      if is_vowel(s[left])
        vowel -= 1
      end
      left += 1
    end
  end
  
  max_vowel
end
