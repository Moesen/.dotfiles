# The points of this script is to give it a text document with rgb values, and it will convert them to hex
import re
import argparse

def rgb_to_hex(rgb: tuple):
    return "#%02x%02x%02x" % rgb

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Give path")
    parser.add_argument('path', metavar="P", type=str, nargs=1, help="Path to config/text document")
    
    args = parser.parse_args()
    
