from collections import defaultdict

class Solution:
    def countVowelSubstrings(self, word):
        vowels_map = {'a': True, 'e': True, 'i': True, 'o': True, 'u': True}
        
        len_word = len(word)
        
        left_index = 0
        right_index = 0
        ret_val = 0
        char_to_freq_map = defaultdict(int)

        i = 0
        while (i < len_word):
            c = word[i]
            if c in vowels_map.keys():
                char_to_freq_map[c] += 1

                while set(char_to_freq_map.keys()) == set(vowels_map.keys()):
                    c = word[right_index]
                    char_to_freq_map[c] -= 1
                    if (char_to_freq_map[c] <= 0):
                        char_to_freq_map.pop(c)
                    right_index += 1
                ret_val += (right_index - left_index)
            else:
                char_to_freq_map.clear()
                left_index = i + 1
                right_index = i + 1
            i += 1
        
        return ret_val