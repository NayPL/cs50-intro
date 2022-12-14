from cs50 import get_float

cents = 0
while cents <= 0:
    cents = get_float("Change owed: ")

def get_quarters(cents):
    quarters = cents // 0.25
    return quarters

def get_dimes(cents):
    dimes = cents // 0.10
    return dimes

def get_nickles(cents):
    nickles = cents // 0.05
    return nickles

def get_pennies(cents):
    pennies = cents // 0.01
    return pennies

quarters = int(get_quarters(cents))
cents1 = round(cents - quarters * 0.25, 2)

dimes = int(get_dimes(cents1))
cents2 = round(cents1 - dimes * 0.10, 2)

nickles = int(get_nickles(cents2))
cents3 = round(cents2 - nickles * 0.05, 2)

pennies = int(get_pennies(cents3))
cents4 = round(cents3 - pennies * 0.01, 2)

owed = quarters + dimes + nickles + pennies
print(f"{owed}")
