import math


def compute_integral(func_name, x_min, x_max, factor=1, delta=0):
    try:
        math_func = getattr(math, func_name)
    except AttributeError:
        print("Error: Invalid function name!")
        return None

    def integrand(xx):
        return factor * math_func(xx + delta)

    n = 1000  # Number of intervals
    dx = (x_max - x_min) / n
    integral_value = 0
    for i in range(n):
        x1 = x_min + i * dx
        x2 = x_min + (i + 1) * dx
        integral_value += 0.5 * (integrand(x1) + integrand(x2)) * dx
    return integral_value


def derivative(func, point, h=0.0001):
    """Compute the derivative of a function at a given point using the central difference method."""
    return (func(point + h) - func(point - h)) / (2 * h)


if __name__ == '__main__':
    # Example usage of derivative:
    f = math.sin
    x = 0.5
    df_dx = derivative(f, x)
    print(df_dx)  # Output: 0.877582560930871

    integral = compute_integral('sin', 0, 2*math.pi)
    print(integral)
