view: blocks {
  sql_table_name: `bitcoin_blockchain.blocks`
    ;;

  dimension: bits {
    type: string
    sql: ${TABLE}.bits ;;
  }

  dimension: coinbase_param {
    type: string
    sql: ${TABLE}.coinbase_param ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.`hash` ;;
  }

  dimension: merkle_root {
    type: string
    sql: ${TABLE}.merkle_root ;;
  }

  dimension: nonce {
    type: string
    sql: ${TABLE}.nonce ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: stripped_size {
    type: number
    sql: ${TABLE}.stripped_size ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension_group: timestamp_month {
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
    sql: ${TABLE}.timestamp_month ;;
  }

  dimension: transaction_count {
    type: number
    sql: ${TABLE}.transaction_count ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
