import time

n = 1
proven = [1]
while(True):
    i = n
    steps = []
    while(i not in proven):
        if(i % 2 == 0):
            i = i // 2
        else:
            i = 3 * i + 1
        steps.append(i)
    if (n % 1000 == 0):
        print("Proven up to:", n)

    proven.extend(steps)
    n += 1
    time.sleep(0.001)