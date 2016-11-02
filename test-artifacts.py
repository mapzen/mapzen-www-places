import os, sys, unittest
from operator import itemgetter

# Mess with the path so that server imports
www_dir = os.path.join(os.path.dirname(__file__), 'www')
sys.path.append(www_dir)
import server

class AppTest (unittest.TestCase):

    def test_links(self):
        ''' Check that basic paths come up HTTP 200 OK
        '''
        client = server.app.test_client()
        paths = ('/', '/static/css/mapzen.styleguide.css',
                 '/static/javascript/mapzen.places.js',
                 '/static/images/max-headroom.gif')

        for path in paths:
            got = client.get(path)
            self.assertEqual(got.status_code, 200)
