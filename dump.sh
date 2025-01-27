# Make db dump
pg_dump -U bor -h localhost -d boris -F c -f /home/dump/django-crm-dump.sql


# Drop db
psql -U bor -h localhost -d boris -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

# Restore
pg_restore -U bor -h localhost -d boris /home/dump/django-crm-dump.sql

# Make sure that schema info was included into the dump. If not - recreate it
pg_dump -U bor -h localhost -d boris -F c -f /home/dump/django-crm-dump.sql
