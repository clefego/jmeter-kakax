from pprint import pprint
import uuid

from requests_toolbelt.sessions import BaseUrlSession


class TestController():

    bs = BaseUrlSession(base_url='http://127.0.0.1:8000')

    def test_root(self):
        resp = self.bs.get('/')
        assert resp.status_code == 200

    def test_create_job(self):
        resp = self.bs.post(f'/jobs/jmx')
        pprint(resp.json())
        assert resp.status_code == 200

    def test_get_job(self):
        resp = self.bs.get(f'/jobs/jmx')
        assert resp.status_code == 200

    def test_updata_job(self):
        resp = self.bs.patch(f'/jobs/jmx')
        assert resp.status_code == 200

    def test_delete_job(self):
        resp = self.bs.delete(f'/jobs/jmx')
        assert resp.status_code == 200
