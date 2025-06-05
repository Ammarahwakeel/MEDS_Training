# EXPONENTIAL FUNCTION IMPLEMENTED IN PYTHON
#%%
def exp(x):
   terms=1
   z=1
   for i in range(1,20):
       terms*=x/i
       z+=terms
   return z   
t=exp(3)
print(t) 


#%% 
# SQUARE ROOT FUNATION IMPLEMENTED IN  PYTHON (IN FLOATING POINT NUMBERS)


#%%
#IMPLEMENTATION OF SQRT (ANSWERS WILL BE IN INTEGERS ONLY)
def sqrt(x):
    if not isinstance(x, int):
        raise ValueError("Input must be an integer")
    if x < 0:
        return None  # Handle negative inputs

    low = 0
    high = x
    ans = 0

    while low <= high:
        mid = (low + high) // 2  # Integer division
        if mid * mid <= x:
            ans = mid
            low = mid + 1
        else:
            high = mid - 1

    return ans

print(sqrt(28))  # Output: 5