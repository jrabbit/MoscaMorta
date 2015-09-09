from bottle import route, run, template
from redis import Redis

redis = Redis(host='redis', port=6379)


@route('/kill')
def kill():
    redis.incr('kills')

    return template('<b>Flies killed: {{num_killed}}</b>!', num_killed=redis.get('kills'))


@route('/')
def index():
    return template('home.tpl', deaths=redis.get('kills'))
run(host='0.0.0.0', port=5000, debug=True, reloader=True)