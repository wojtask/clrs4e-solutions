import mpmath


def print_values(func):
    MICROSECONDS_PER_SECOND = 1_000_000
    SECONDS_PER_MINUTE = 60
    MINUTES_PER_HOUR = 60
    HOURS_PER_DAY = 24
    DAYS_PER_MONTH = 30
    DAYS_PER_YEAR = 365
    YEARS_PER_CENTURY = 100

    total_microseconds = MICROSECONDS_PER_SECOND
    print("\t1 second :", func(total_microseconds))
    total_microseconds *= SECONDS_PER_MINUTE
    print("\t1 minute :", func(total_microseconds))
    total_microseconds *= MINUTES_PER_HOUR
    print("\t1 hour   :", func(total_microseconds))
    total_microseconds *= HOURS_PER_DAY
    print("\t1 day    :", func(total_microseconds))
    print("\t1 month  :", func(total_microseconds * DAYS_PER_MONTH))
    total_microseconds *= DAYS_PER_YEAR
    print("\t1 year   :", func(total_microseconds))
    total_microseconds *= YEARS_PER_CENTURY
    print("\t1 century:", func(total_microseconds))


def factorial_solver(limit: int) -> int:
    factorial = 1
    k = 0
    while factorial * (k + 1) < limit:
        k += 1
        factorial *= k
    return k


print("\\lg n:")
print_values(lambda microseconds: mpmath.power(2.0, microseconds))

print("\n\\sqrt{n}:")
print_values(lambda microseconds: mpmath.power(microseconds, 2))

print("\nn:")
print_values(lambda microseconds: int(microseconds))

print("\nn\\lg n:")
print_values(lambda microseconds: int(mpmath.findroot(lambda n: n * mpmath.log(n, 2) - microseconds, 1)))

print("\nn^2:")
print_values(lambda microseconds: int(mpmath.sqrt(microseconds)))

print("\nn^3:")
print_values(lambda microseconds: int(mpmath.root(microseconds, 3)))

print("\n2^n:")
print_values(lambda microseconds: int(mpmath.log(microseconds, 2)))

print("\nn!:")
print_values(lambda microseconds: factorial_solver(microseconds))
