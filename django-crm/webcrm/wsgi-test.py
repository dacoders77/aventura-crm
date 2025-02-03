# Run wsgi with no nginx or django webserver and navigate to yoursite:8000. Should work

def application(env, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    return [b"WSGI is working"]

#(venv) root@02d74b4d0fd1:/home/aventura-crm/django-crm# uwsgi --http :8000 --module webcrm.wsgi-tese
# webcrm.wsgi = webcrm/wsgi.py
# wsgi.py is django unix websocket entry point
# Executed from django-crm root. Works good

