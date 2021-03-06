#!/usr/bin/env python
# -*- coding:utf-8 -*-

import json
import tornado.web


class BaseHandler(tornado.web.RequestHandler):

    @property
    def db(self):
        return self.application.db

    def on_finish(self):
        self.db.flush()
        self.db.close()

    def ok(self, data):
        self.set_header('Content-Type', 'application/json; charset="utf-8"')
        self.write(json.dumps({"status": "ok", "data": data}))

    def error(self, status_code, msg):
        self.set_header('Content-Type', 'application/json; charset="utf-8"')
        self.set_status(status_code)
        self.write(json.dumps({"msg": msg}))
