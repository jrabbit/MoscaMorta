import json

from bottle import route, run, template, static_file, request
from redis import Redis

redis = Redis(host='redis', port=6379)


@route('/kill', method='POST')
def kill():
    redis.incr('kills')
    if request.forms.get("name"):
        user = request.forms.get("name")
        # print user
        redis.incr(user)
        return template('<b>Flies killed: {{num_killed}}</b>!', num_killed=redis.get(user))
    else:
        return template('<b>Flies killed: {{num_killed}}</b>!', num_killed=redis.get('kills'))

@route('/kill/<user>')
def user_kill(user):
    redis.incr('kills')
    redis.incr(user)
    return template('<b>Flies killed: {{num_killed}}</b>!', num_killed=redis.get(user))


@route('/scoreboard')
def scoreboard():
    keys = redis.keys()
    l = [{"name":k, "score":int(redis.get(k))} for k in keys if k != "kills"]
    return json.dumps(sorted(l, key=lambda x: x['score'], reverse=True))

@route('/')
def index():
    return template('home.tpl', deaths=redis.get('kills'))

@route('/bower_components/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='bower_components')
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static')

run(host='0.0.0.0', port=5000, debug=True, reloader=True)