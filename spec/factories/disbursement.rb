FactoryBot.define do
  factory :disbursement do
    merchant

    fee { 1 }
    calculated_at { Time.zone.now }
    calculated_since { 1.week.ago.beginning_of_week }
    calculated_to { 1.week.ago.end_of_week }
  end
end
