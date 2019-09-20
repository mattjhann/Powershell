# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

add = 1
test = True
x = 0
y = 1
while test:
    test = True
    x = x + add
    for i in range(y,20):
        if x % i == 0:
            test = False
        else:
            test = True
            x = x + add
            if i > y + 1:
                y = i - 1
            break


print(y)
