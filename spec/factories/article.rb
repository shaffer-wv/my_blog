# spec/factories/article.rb
FactoryGirl.define do
	factory :article do |f|
		f.title "Sample Article"
		f.body "This is some random text."
	end
end