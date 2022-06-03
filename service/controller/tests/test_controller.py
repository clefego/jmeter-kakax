from requests_toolbelt.sessions import BaseUrlSession


class TestController():

    bs = BaseUrlSession(base_url='http://127.0.0.1:8003')

    def test_root(self):
        resp = self.bs.get('/')
        assert resp.status_code == 200
