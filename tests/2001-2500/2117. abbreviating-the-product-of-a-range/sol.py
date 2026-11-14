import math

class Solution:
    def abbreviateProduct(self, left: int, right: int) -> str:
        last = 1
        modulo = 10 ** 5

        twosCount = 0
        fivesCount = 0

        sumLog10 = 0
        maxBufferValue = 10 ** 1200
        bufferProduct = 1
        
        for x in range(left, right + 1):
            bufferProduct *= x

            if bufferProduct > maxBufferValue:
                sumLog10 += math.log10(bufferProduct)
                bufferProduct = 1

            while x % 2 == 0:
                twosCount += 1
                x //= 2
                
            while x % 5 == 0:
                fivesCount += 1
                x //= 5
            
            last = (last * x) % modulo        

        sumLog10 += math.log10(bufferProduct)
        zerosCount = min(twosCount, fivesCount)

        if sumLog10 < 10 + zerosCount:
            productString = str(bufferProduct)
            return productString[:len(productString) - zerosCount] + 'e' + str(zerosCount)
        
        twosCount -= zerosCount
        fivesCount -= zerosCount        
        
        last = (last * (pow(2, twosCount) % modulo)) % modulo
        last = (last * (pow(5, fivesCount) % modulo)) % modulo
        first = int(pow(10, sumLog10 % 1 + 4.0))
       
        return str(first) + '...' + str(last).zfill(5) + 'e' + str(zerosCount)
