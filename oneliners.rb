#
# Postgres - show table sizes
#
ap ActiveRecord::Base.connection.execute("select table_name,n_live_tup, pg_size_pretty(pg_relation_size(table_name)) from information_schema.tables inner join pg_stat_user_tables on table_name=relname where table_schema = 'public' order by pg_relation_size(table_name) desc").to_a
