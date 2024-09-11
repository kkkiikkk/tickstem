FactoryBot.define do
  factory :ticket do
    request_number { "09252012-00001" }
    sequence_number { "2421" }
    request_type { "Normal" }
    response_due_date_time { "2011-07-13 23:59:59" }
    primary_service_area_code { "ZZGL103" }
    additional_service_area_codes { ["ZZL01", "ZZL02", "ZZL03"] }
    digsite_info { "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295))" }
  end
end