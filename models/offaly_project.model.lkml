connection: "dave_big_query"

include: "/Views/edenderry_weather.view"

datagroup: offaly_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: offaly_project_default_datagroup

explore: edenderry_weather {}
