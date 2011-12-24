class Challenge    
  include Rails.application.routes.url_helpers
  include Mongoid::Document 
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  has_many :child_challenges, :class_name => "ChildChallenge"

  # TASKS
  embeds_many :tasks
  accepts_nested_attributes_for :tasks, :child_challenges

  field :title, :type=>String
  field :description, :type=>String
  field :canCompleteBeforeTasks,:type=>Boolean

  # challenge status
  field :is_complete, :default => 0

  #validates :title, :presence => true

  # RDBMS associations
  field :user_id, :type=>String

  scope :social_n_parents, where(:social_type.exists => true).and(:challenge_id.exists => false)
  scope :recently_created, desc(:created_at)  

  # STARTING & ENDING POINTS
  embeds_one :start_point, :class_name => "PointType"
  embeds_one :end_point, :class_name => "PointType"

  # CHALLENGE TYPE SOCIAL & PERSONAL
  embeds_one :personal_type, :class_name => "ChallengePersonalType"
  embeds_one :social_type, :class_name => "ChallengeSocialType"   

  # HELPER FUNCTIONS FROM HERE ON
  def parent
    Challenge.find(self.challenge_id) rescue nil
  end

  def self.whatsNew    
    Challenge.social_n_parents.recently_created.limit(3)
  end
  
  def self.all_winners()
    score = Challenge.collection.map_reduce(
      "function() { this.tasks.forEach(function(s){ emit(s.name, 1); }); }",
      "function(key,values) { var sum = 0; values.forEach(function(v){ sum += v.score; }); return sum; }"
    )
    opts = { :sort => ["_id", :desc] }

    score.find({}, opts).to_a \
        .map!{|item| { :name => item['_id'], :score_sum => item['value'].to_i } }
  end
  
  
   def self.task_score_map
    <<-MAP
      function() {
        this.tasks.forEach(function(aTask) {
          emit(aTask.score, {score: aTask.score});
        });
      }
    MAP
  end
  
  def self.task_score_reduce
    <<-REDUCE
      function(key, values) {
         var sum = 0;
         values.forEach(function(aScore) {
            sum += parseInt(aScore.score);
        });
        return sum;
        }
    REDUCE
  end
  
  def self.task_score_build(opts)
    self.collection.map_reduce(self.task_score_map, self.task_score_reduce, opts)
  end
  
  def self.task_score(opts={}) 
    hash = opts.merge({ 
      :out    => {:inline => true}, 
      :raw    => true 
    }) 
    self.task_score_build(hash).find() 
  end
  
end                