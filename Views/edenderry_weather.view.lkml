view: edenderry_weather {
  sql_table_name: offaly.offaly_weather ;;

  measure: count {
    type: count
    drill_fields: []
  }

  dimension : edenderry {
    type: location
    sql_latitude: 53.331 ;;
    sql_longitude:-7.125 ;;
  }

  dimension_group: date_of_reading {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      quarter_of_year,
      day_of_month,
      day_of_week,
      day_of_week_index,
      day_of_year,
      month_name,
      month_num,
      week_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  measure: soil_temp {
    type: sum
    sql: ${TABLE}.soil_temp ;;
    value_format: "0.00"
  }
  dimension: soil_temp_2 {
    type: number
    sql: ${TABLE}.soil_temp ;;
    value_format: "0.00"
  }

  measure: ground_min_temp {
    type: sum
    sql: ${TABLE}.ground_min_temp ;;
    value_format: "0.00"
  }

#   measure: min_temp {
#     type: sum
#     sql: ${TABLE}.min_temp ;;
#     value_format: "0.00"
#   }
#
#   measure: max_temp {
#     type: sum
#     sql: ${TABLE}.max_temp ;;
#     value_format: "0.00"
#   }

  measure: min_temp {
    type: min
    sql: ${TABLE}.min_temp ;;
    value_format: "0.00"
  }

  measure: avg_min_temp {
    type: average
    sql: ${TABLE}.min_temp ;;
    value_format: "0.00"
  }

  measure: max_temp {
    type: max
    sql: ${TABLE}.max_temp ;;
    value_format: "0.00"
  }

  measure: avg_max_temp {
    type: average
    sql: ${TABLE}.max_temp ;;
    value_format: "0.00"
  }

  measure: rain {
    type: sum
    sql: ${TABLE}.rain ;;
    value_format: "0.00"
    drill_fields: [date_of_reading_date,max_temp]
  }


#   measure: avg_daily_max_temp {
#     type: average
#     sql: ${TABLE}.max_temp ;;
#     value_format: "0.00"
#   }
#
#   measure: avg_daily_min_temp {
#     type: average
#     sql: ${TABLE}.min_temp ;;
#     value_format: "0.00"
#   }
}
