import zipfile
import sys
import os
import getpass
import shutil
import paramiko
from scp import SCPClient
from os.path import expanduser
from os.path import basename

def createSSHClient(server, port, user, password):
    paramiko.util.log_to_file("filename.log")
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=server, username=user, password=password)
    return client

path = sys.argv[1]
name = sys.argv[2]
zipfile.ZipFile(name + ".zip", 'w', zipfile.ZIP_DEFLATED).write(path + name + ".xcos", basename(path + name + ".xcos"))
#shutil.move(path + name + '.zip', expanduser("~") + "/rasp30/sci2blif/" + name + '.zip')

username = raw_input("GTID: ")
password = getpass.getpass()

ssh = createSSHClient('rg-fpaa-host.crnch.gatech.edu', 22, username, password)
scp = SCPClient(ssh.get_transport())
#scp.put('export.py', 'export.py')
scp.put(expanduser("~") + "/rasp30/sci2blif/" + name + '.zip', 'compressed_files/' + name + '.zip')