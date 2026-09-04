class Solution:
    def countValidWords(self, sentence: str) -> int:
        def is_valid_word(token):
            len_token = len(token)
            
            i = 0
            while (i < len_token):
                c = token[i]
                if (ord(c) not in range(ord('a'), ord('z') + 1)
                    and c != '-'
                    and c not in ('!', '.', ',')):
                    return False
                elif (c == '-'
                      and i > 1
                      and not token[:i].isalpha()):
                    return False
                elif (c == '-'
                      and i < len_token - 1
                      and (not token[i+1:].isalpha() and not (token[i+1:-1].isalpha() and token[-1] in ('!', '.', ',')))):
                    return False
                elif (c == '-'
                      and (i == 0 or i == len_token-1)):
                    return False
                elif (c in ('!', '.', ',')
                      and i < len_token - 1):
                    return False

                i += 1

            return True

        tokens = [t for t in sentence.split(' ') if t != '']
        count_valid_words = 0
        for token in tokens:
            print(token, is_valid_word(token))
            if (is_valid_word(token)):
                count_valid_words += 1
        
        return count_valid_words