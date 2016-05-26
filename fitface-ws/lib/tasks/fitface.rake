task delete_floating_records: :environment do
  User.delete_floating_records
end
