#spec/models/article_spec.rb
require 'spec_helper'

describe Article do
  it "has a valid factory" do
  	FactoryGirl.create(:article).should be_valid
  end
  it "is invalid without a title" do
  	FactoryGirl.build(:article, title: nil).should_not be_valid
	end
  it "is invalid without a body" do
  	FactoryGirl.build(:article, body: nil).should_not be_valid
	end
end