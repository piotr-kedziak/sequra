MoneyRails.configure do |config|
  config.locale_backend = :i18n
  config.rounding_mode = BigDecimal::ROUND_HALF_EVEN
  # config.default_currency = :usd
end
