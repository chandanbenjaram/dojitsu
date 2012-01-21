require 'spec_helper'

describe Challenge do
  
  describe "Validation" do
    
    it "should not be valid without a title" do
      aChallenge = Challenge.create(:title => "")
      aChallenge.should_not be_valid
    end
    
    it "save the title and validate" do
      aChallenge = Challenge.create(:title => "Challenge testing")
      aChallenge.title.should == "Challenge testing"
    end
    
  end
  
  describe "Associations" do
    it "has many child_challenges" do
      Challenge.new.should respond_to(:child_challenges)
    end
    
    it "embeds many tasks" do
      Challenge.new.should respond_to(:tasks)
    end
    
    it "embeds one start_point" do
      Challenge.new.should respond_to(:start_point)
    end
    
    it "embeds one end_point" do
      Challenge.new.should respond_to(:end_point)
    end
    
    it "embeds one personal_type" do
      Challenge.new.should respond_to(:personal_type)
    end
    
    it "embeds one social_type" do
      Challenge.new.should respond_to(:social_type)
    end
  end
  
  describe "Nested Attributes for tasks model" do
    context "creating" do
      subject { Challenge.new(:title => "Social Challenge", :description =>"Social Desc")}
      it "creates an tasks" do
        lambda {
          subject.attributes = {:tasks_attributes => [{:score_by => "self reported",
                                                       :score => "12",
                                                       :name => "task no 1",
                                                       :is_complete => "1"
              }]}
          subject.save!
        }.should change { subject.tasks(true).count}.from(0).to(1)
      end
      
      it "ignors all blank tasks records" do
        lambda {
          subject.attributes = {:tasks_attributes => [{:score_by => "",
                                                       :score => "",
                                                       :name => "",
                                                       :is_complete => ""
              }]}
          subject.save!
        }.should_not change(Task, :count)
      end
      
    end
  end
  
  describe "Scope ':social_n_parents'" do
    it "should have the scope" do
      Challenge.should respond_to(:social_n_parents)
    end
    
    it "should include social challenge excluding child challenge" do
      @challenge = Challenge.create(:social_type.exists => true, :challenge_id.exists => false)
      Challenge.social_n_parents.should include(@challenge)
    end
    
    it "should include Challenge with social_type flag" do
      socialChallenge = Challenge.create! :social_type.exists => true
      Challenge.socialChallenge.should include(socialChallenge)
    end
  end
  
  describe "associations" do
    it "should be embedded in a challenge" do
      association = Task.associations['challenge']
      association.class.should ==(Challenge)
      association.association.should ==(Mongoid::Associations::EmbeddedIn)
      association.inverse_of.should ==(:tasks)
    end
  end
  
end