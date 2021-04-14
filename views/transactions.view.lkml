view: transactions {
  sql_table_name: `bitcoin_blockchain.transactions`
    ;;

  dimension: block_hash {
    type: string
    sql: ${TABLE}.block_hash ;;
  }

  dimension: block_number {
    type: number
    sql: ${TABLE}.block_number ;;
  }

  measure: blocks {
    type: count_distinct
    sql: ${block_number} ;;
  }

  dimension: block_timestamp_hour {
    type: number
    sql: ${TABLE}.block_timestamp_hour ;;
  }

  dimension_group: block_timestamp {
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
    sql: ${TABLE}.block_timestamp ;;
  }

  measure: min_block_timestamp {
    type: date_time
    sql: MIN(${block_timestamp_raw}) ;;
  }

  measure: max_block_timestamp {
    type: date_time
    sql: MAX(${block_timestamp_raw}) ;;
  }

  dimension_group: block_timestamp_month {
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
    sql: ${TABLE}.block_timestamp_month ;;
  }

  dimension: fee {
    type: number
    sql: ${TABLE}.fee ;;
  }

  measure: total_fee {
    type: sum
    sql: ${fee} ;;
    value_format: "#,###"
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.`hash` ;;
  }

  dimension: input_count {
    type: number
    sql: ${TABLE}.input_count ;;
  }

  dimension: input_value {
    type: number
    sql: ${TABLE}.input_value ;;
  }

  dimension: inputs {
    hidden: yes
    sql: ${TABLE}.inputs ;;
  }

  dimension: is_coinbase {
    type: yesno
    sql: ${TABLE}.is_coinbase ;;
  }

  dimension: lock_time {
    type: number
    sql: ${TABLE}.lock_time ;;
  }

  dimension: output_count {
    type: number
    sql: ${TABLE}.output_count ;;
  }

  dimension: output_value {
    type: number
    sql: ${TABLE}.output_value ;;
  }

  dimension: outputs {
    hidden: yes
    sql: ${TABLE}.outputs ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: virtual_size {
    type: number
    sql: ${TABLE}.virtual_size ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: transactions {
    type: count
  }

  measure: days {
    type: count_distinct
    sql: ${block_timestamp_date} ;;
  }

  measure: transactions_per_day{
    type: number
    sql: ${transactions}/${days} ;;
    value_format: "#,###"
  }
}

view: transactions__inputs {
  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: required_signatures {
    type: number
    sql: ${TABLE}.required_signatures ;;
  }

  dimension: script_asm {
    type: string
    sql: ${TABLE}.script_asm ;;
  }

  dimension: script_hex {
    type: string
    sql: ${TABLE}.script_hex ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: spent_output_index {
    type: number
    sql: ${TABLE}.spent_output_index ;;
  }

  dimension: spent_transaction_hash {
    type: string
    sql: ${TABLE}.spent_transaction_hash ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: transactions__outputs {
  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: required_signatures {
    type: number
    sql: ${TABLE}.required_signatures ;;
  }

  dimension: script_asm {
    type: string
    sql: ${TABLE}.script_asm ;;
  }

  dimension: script_hex {
    type: string
    sql: ${TABLE}.script_hex ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
}

view: transactions__inputs__addresses {
  dimension: transactions__inputs__addresses {
    type: string
    sql: transactions__inputs__addresses ;;
  }
}

view: transactions__outputs__addresses {
  dimension: transactions__outputs__addresses {
    type: string
    sql: transactions__outputs__addresses ;;
  }
}
