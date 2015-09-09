from bottle import route, run, template, static_file
from redis import Redis

redis = Redis(host='redis', port=6379)


@route('/kill')
def kill():
    redis.incr('kills')

    return template('<b>Flies killed: {{num_killed}}</b>!', num_killed=redis.get('kills'))


@route('/')
def index():
    return template('home.tpl', deaths=redis.get('kills'))

@route('/bower_components/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='bower_components')

run(host='0.0.0.0', port=5000, debug=True, reloader=True)