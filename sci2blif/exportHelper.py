import zipfile
import sys
import os
import getpass
import shutil
import paramiko
from scp import SCPClient
from os.path import expanduser
from os.path import basename

# SSH's into RASPI
def createSSHClient(server, port, user, password):
    paramiko.util.log_to_file("filename.log")
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=server, username=user, password=password)
    return client

path = sys.argv[1]
name = sys.argv[2]
# Zips file
zipfile.ZipFile(name + ".zip", 'w', zipfile.ZIP_DEFLATED).write(path + name + ".xcos", basename(path + name + ".xcos"))

# Gets GT username and password
username = input("GTID: ")
password = getpass.getpass()

# Creates SSH and SCP Client
ssh = createSSHClient('rg-fpaa-host.crnch.gatech.edu', 22, username, password)
scp = SCPClient(ssh.get_transport())

# Creates compressed_files if not already made
stdin, stdout, stderr = ssh.exec_command("mkdir -p compressed_files")

# Places zipped file into compressed_files
scp.put(expanduser("~") + "/rasp30/sci2blif/" + name + '.zip', 'compressed_files/' + name + '.zip')

# Removes zipped file from user directory
os.remove(name + '.zip')

input("DONE! Press enter to exit.")