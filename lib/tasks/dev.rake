# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc 'Sample data for local development environment'
    task prime: %w[db:setup] do
    end
  end
end
