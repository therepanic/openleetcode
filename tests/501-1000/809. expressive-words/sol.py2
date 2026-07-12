class Solution(object):
    def expressiveWords(self, s, words):
        def encode(x):
            chars, cnts = [], []
            prev, c = None, 0
            for ch in x:
                if ch == prev:
                    c += 1
                else:
                    if prev is not None:
                        chars.append(prev)
                        cnts.append(c)
                    prev, c = ch, 1
            chars.append(prev)
            cnts.append(c)
            return chars, cnts

        s_chars, s_cnts = encode(s)
        ans = 0
        for w in words:
            w_chars, w_cnts = encode(w)
            if w_chars != s_chars:
                continue
            ok = True
            for sc, wc in zip(s_cnts, w_cnts):
                if sc < wc or (sc < 3 and sc != wc):
                    ok = False
                    break
            if ok:
                ans += 1
        return ans
