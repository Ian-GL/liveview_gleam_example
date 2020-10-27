import gleam/io

pub type FinancialInformation {
  FinancialInformation(balance: Int, credit_score: Int, average_balance: Int)
}

pub type PublicUser {
  PublicUser(name: String, last_name: String, credit_approved: Bool)
}

pub fn calculate_credit_approved(user: PublicUser, financial_information: FinancialInformation) -> Bool{
  let FinancialInformation(balance, credit_score, average_balance) = financial_information;
  io.debug("-- GLEAM --")
  io.debug(financial_information)

  case [balance, credit_score, average_balance] {
    [balance, _, _] if balance > 2000 -> True
    [_, credit_score, _] if credit_score > 700 -> True
    [_, _, average_balance] if average_balance > 1000 -> True
    _ -> False
  }
}

pub fn populate_user_with_credit(user: PublicUser, financial_information: FinancialInformation) -> PublicUser{
  let credit_approved = calculate_credit_approved(user, financial_information)
  let updated_user = PublicUser(..user, credit_approved: credit_approved)
  updated_user
}