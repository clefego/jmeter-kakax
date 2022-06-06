import json
from pprint import pprint
from requests_toolbelt.sessions import BaseUrlSession


class TestController():

    bs = BaseUrlSession(base_url='http://127.0.0.1:8004')

    def test_upload(self):
        with open('./service/files/README.md', 'r') as fp:
            resp = self.bs.post('/upload', files={'fp': fp})
        assert resp.status_code == 200

    def test_file_list(self):
        resp = self.bs.get('/file_list')
        pprint(resp.json())
        assert resp.status_code == 200

    def test_download(self):
        resp = self.bs.get('/download/README.md')
        assert resp.status_code == 200
