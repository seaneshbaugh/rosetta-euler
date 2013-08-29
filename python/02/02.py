from math import sqrt

def fib(n):
    n = (((1 + sqrt(5))**n)-((1-sqrt(5))**n))/((2**n)*sqrt(5))
    return n

if __name__ == '__main__':
    x = 0
    fib_arr = [fib(x)]
    while True:
        x = x + 1
        n = fib(x)
        if n > 4000000:
          break
        else:
          if (int(n) % 2) == 0:
              fib_arr.append(n)
    print(int(sum(fib_arr)))
