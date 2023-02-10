FactoryBot.define do
	factory :task do
		title { FFaker::Name.name }
		description { FFaker::DizzleIpsum.paragraph }
	end
end