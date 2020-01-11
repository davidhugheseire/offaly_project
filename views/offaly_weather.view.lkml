view: offaly_weather {
  sql_table_name: offaly.offaly_weather ;;

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

  measure: ground_min_temp {
    type: sum
    sql: ${TABLE}.ground_min_temp ;;
  }

  measure: max_temp {
    type: sum
    sql: ${TABLE}.max_temp ;;
  }

  measure: min_temp {
    type: sum
    sql: ${TABLE}.min_temp ;;
  }

  measure: rain {
    type: sum
    sql: ${TABLE}.rain ;;
    value_format_name: "decimal_2"
  }

  measure: soil_temp {
    type: sum
    sql: ${TABLE}.soil_temp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

#   dimension: latitude {
#
#   }
#   dimension: longitude {}
#
#   :53.331
#   : -7.125


  dimension : edenderry {
    type: location
    sql_latitude: 53.331 ;;
    sql_longitude:-7.125 ;;
  }
}
