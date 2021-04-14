connection: "bitcoin_blockchain"

# include all the views
include: "/views/**/*.view"

datagroup: bitcoin_blockchain_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bitcoin_blockchain_default_datagroup

explore: blocks {}

explore: transactions {
  join: transactions__inputs {
    view_label: "Transactions: Inputs"
    sql: LEFT JOIN UNNEST(${transactions.inputs}) as transactions__inputs ;;
    relationship: one_to_many
  }

  join: transactions__outputs {
    view_label: "Transactions: Outputs"
    sql: LEFT JOIN UNNEST(${transactions.outputs}) as transactions__outputs ;;
    relationship: one_to_many
  }

  join: transactions__inputs__addresses {
    view_label: "Transactions: Inputs Addresses"
    sql: LEFT JOIN UNNEST(${transactions__inputs.addresses}) as transactions__inputs__addresses ;;
    relationship: one_to_many
  }

  join: transactions__outputs__addresses {
    view_label: "Transactions: Outputs Addresses"
    sql: LEFT JOIN UNNEST(${transactions__outputs.addresses}) as transactions__outputs__addresses ;;
    relationship: one_to_many
  }

  join: blocks {
    type: left_outer
    relationship: many_to_one
    sql_on: ${transactions.block_number} = ${blocks.number}  ;;
  }

  join: date_table {
    view_label: "Transactions Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${transactions.block_timestamp_date} = ${date_table.date_date}  ;;
  }

}
