import os

if "TD_USER" in os.environ:
    print(os.environ["TD_USER"])
else:
    print("No TD_USER")
    
print("Hello world!")
