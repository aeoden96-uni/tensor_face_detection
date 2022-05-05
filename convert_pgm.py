import os
from PIL import Image

print(os.listdir('data/test_dir'))

# for file in os.listdir('data/test_dir'):
filename, extension  = os.path.splitext(os.listdir('data/test_dir')[0])
if extension == ".pgm":
    new_file = "data/test_dir/123.png"
    with Image.open('data/test_dir/0000_0_0_0_15_0_1.pgm') as im:
        im.save(new_file)
