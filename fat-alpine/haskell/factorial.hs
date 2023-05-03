fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1) --recursion

main = print (fac 4)

factorial(n) = print (fac n)

--simple Haskell version of Factorial, without the need of recursion
productFactorial n = product[1..n]

help = print "Available functions:\n main \n factorial(n) \n help"
