# require needed files
require 'helpers/validations'
require 'helpers/cart'
require 'helpers/shipping'
require 'helpers/multi_step_form'

# create BreadExpressHelpers
module ChessStoreHelpers
  include ChessStoreHelpers::Validations
  include ChessStoreHelpers::Shipping
  include ChessStoreHelpers::Cart
  include ChessStoreHelpers::MultiStepForm
end