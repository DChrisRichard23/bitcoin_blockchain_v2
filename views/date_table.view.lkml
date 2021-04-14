view: date_table {
  sql_table_name: `mw-data-analytics-sandbox.bitcoin_blockchain.date_table`
    ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: day_of_week_name {
    type: string
    sql: ${TABLE}.day_of_week_name ;;
    order_by_field: day_of_week_num
  }

  dimension: day_of_week_num {
    type: number
    sql: ${TABLE}.day_of_week_num ;;
  }

  dimension: month_name_short {
    type: string
    sql: ${TABLE}.month_name_short ;;
    order_by_field: month_num
  }

  dimension: month_num {
    type: number
    sql: ${TABLE}.month_num ;;
  }

  dimension: this_month_flag {
    type: number
    sql: ${TABLE}.this_month_flag ;;
  }

  dimension: this_week_flag {
    type: number
    sql: ${TABLE}.this_Week_flag ;;
  }

  dimension: this_year_flag {
    type: number
    sql: ${TABLE}.this_year_flag ;;
  }

  dimension: today_flag {
    type: number
    sql: ${TABLE}.today_flag ;;
  }

  dimension: week_number {
    type: number
    sql: ${TABLE}.week_number ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: year_month {
    type: string
    sql: ${TABLE}.year_month ;;
  }

  dimension: year_quarter {
    type: string
    sql: ${TABLE}.year_quarter ;;
  }

  dimension: year_week {
    type: string
    sql: ${TABLE}.year_week ;;
  }

  measure: count {
    type: count
    drill_fields: [day_of_week_name]
  }
}
