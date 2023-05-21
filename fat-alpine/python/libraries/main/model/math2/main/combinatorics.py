import math


def permutation(n, r):
    """
    Computes the number of permutations of n objects taken r at a time.
    """
    return math.factorial(n) // math.factorial(n - r) # // is a floor division operator in Python. 5 // 2 would return 2


def combination(n, r):
    """
    Computes the number of combinations of n objects taken r at a time.
    """
    return permutation(n, r) // permutation(r, r)


def variation_with_repetition(n, r):
    """
    Computes the number of variations of n objects taken r at a time, with repetition allowed.
    """
    return n ** r  # In Python, the double asterisks (**) represent the exponentiation operator. So n ** r means n
    # raised to the power of r. For example, 2 ** 3 equals 8 because 2 raised to the power of 3 equals 8.


def variation_without_repetition(n, r):
    """
    Computes the number of variations of n objects taken r at a time, without repetition.
    """
    return permutation(n, n) // permutation(n, r)
