# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?
import math

def primeFactors(x):
        factors = []
        i = 2
        j = x
        while j > 1:
                if j % i != 0:
                        i = i + 1
                else:
                        factors.append(i)
                        j = j / i

        return factors


print(max(primeFactors(600851475143)))
