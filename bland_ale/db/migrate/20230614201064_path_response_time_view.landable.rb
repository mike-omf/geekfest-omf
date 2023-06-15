# This migration comes from landable (originally 20140602213937)
class PathResponseTimeView < ActiveRecord::Migration[4.2]
  def up
    execute <<-SQL
  	DROP VIEW IF EXISTS #{Landable.configuration.database_schema_prefix}landable_traffic.path_response_time__by_time;
	CREATE OR REPLACE VIEW #{Landable.configuration.database_schema_prefix}landable_traffic.path_response_time__by_time
	AS
	SELECT *
	FROM
	(
		SELECT
		 p.path_id as path_id
		, p.path as path
		,round(avg(pv.response_time), 3) as "average response time (ms)"
		FROM #{Landable.configuration.database_schema_prefix}landable_traffic.page_views pv
		  JOIN #{Landable.configuration.database_schema_prefix}landable_traffic.paths p
		    on p.path_id = pv.path_id
		group by p.path_id, p.path
	) agg1
	order by agg1."average response time (ms)" desc
	;

	COMMENT ON VIEW #{Landable.configuration.database_schema_prefix}landable_traffic.path_response_time__by_time IS $$ The view path_response_time__by_time returns the paths displayed and the average reponse time (in ms) for each page of the site.  This list is ordered by response time, decending.$$;
    SQL
  end
end
