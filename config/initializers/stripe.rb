Rails.configuration.stripe = {
  :publishable_key => Admin.stripe_publishable_key,
  :secret_key      => Admin.stripe_secret_key
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]