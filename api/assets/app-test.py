import unittest
import app  # your Flask application module

class UptimeCheckTest(unittest.TestCase):
    def setUp(self):
        self.app = app.app.test_client()

    def test_uptime_check(self):
        try:
            response = self.app.get('/uptime-check')
        except TypeError:
            response = self.app.get('/uptime-check', as_tuple=False)
        
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_json(), {'status': 'OK'})

if __name__ == '__main__':
    unittest.main()
