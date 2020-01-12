view: edenderry_weather {
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

  dimension: sort {
    type: number
    sql: case when ${date_of_reading_month_name} = 'December' then 1
              when ${date_of_reading_month_name} = 'January' then 2
              when ${date_of_reading_month_name} = 'February' then 3
          end;;
  }

  measure: ground_min_temp {
    type: sum
    sql: ${TABLE}.ground_min_temp ;;
    value_format: "0.00"
  }

  dimension: max_daily_temp {
    type: number
    sql: ${TABLE}.max_temp ;;
    value_format: "0.00"
  }

  measure: avg_daily_max_temp {
    type: average
    sql: ${TABLE}.max_temp ;;
    value_format: "0.00"
  }

  measure: avg_daily_mix_temp {
    type: average
    sql: ${TABLE}.min_temp ;;
    value_format: "0.00"
  }

  measure: min_temp {
    type: sum
    sql: ${TABLE}.min_temp ;;
    value_format: "0.00"
  }

  measure: rain {
    type: sum
    sql: ${TABLE}.rain ;;
    value_format: "0.00"
  }

  measure: soil_temp {
    type: sum
    sql: ${TABLE}.soil_temp ;;
    value_format: "0.00"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension : edenderry {
    type: location
    sql_latitude: 53.331 ;;
    sql_longitude:-7.125 ;;
  }
}
