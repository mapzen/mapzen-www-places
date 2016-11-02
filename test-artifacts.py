import os, sys, shutil
from operator import itemgetter

# Mess with the path so that server imports
www_dir = os.path.join(os.path.dirname(__file__), 'www')
sys.path.append(www_dir)
import server

(dirname, ) = sys.argv[1:]
client = server.app.test_client()

paths = [('/', 'index.html')]

for (path, name) in paths:
    got = client.get(path)
    filepath = os.path.join(dirname, name)
    dirpath = os.path.dirname(filepath)
    
    if got.status_code != 200:
        raise Exception('Failed to get {}'.format(path))

    if not os.path.exists(dirpath):
        os.makedirs(dirpath)
    
    with open(filepath, 'w') as file:
        file.write(got.data)
