import sys
import os

os.system("cd ~/rasp30/sci2blif && gnome-terminal -e 'python3 exportHelper.py" + " " + sys.argv[1] + " " + sys.argv[2] + "'")