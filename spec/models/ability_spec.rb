require 'spec_helper'
require "cancan/matchers"

describe Ability do
  it "test admin behaviour" do
  	user = User.new(:username => "admin", :email => "admin@example.com", :password => "secret")
    user.admin = true
    user.save!

  	ability = Ability.new(user)
  	ability.should be_able_to(:manage, :all)  	
  end

  it "test user behaviour" do
  	user = User.new(:username => "user", :email => "user@example.com", :password => "secret")    
    user.save!

    ability = Ability.new(user)
    ability.should be_able_to(:read, :all)
    ability.should be_able_to(:create, Comment.new)
    ability.should be_able_to(:create, Review.new)
    ability.should_not be_able_to(:create, Movie.new)
    ability.should_not be_able_to(:destroy, :all)
    ability.should_not be_able_to(:edit, :all)    
  end
end
