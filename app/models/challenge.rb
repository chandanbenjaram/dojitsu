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
  field :pagecount, :default => 0
  # challenge status
  field :is_complete, :default => 0

  #validates :title, :presence => true
  validates_presence_of :title, :message => "Please enter title!"
  validates_length_of :title, :within => 1..30, :too_long => "Title must be between one and 30 characters", :too_short => "Title must be between one and 30 characters"
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
  
  private
  
  def self.all_winners()
    score = Challenge.collection.map_reduce(
      "function() { this.tasks.forEach(function(s){ emit(s.name, 1); }); }",
      "function(key,values) { var sum = 0; values.forEach(function(v){ sum += v.score; }); return sum; }"
    )
    opts = { :sort => ["_id", :desc] }

    score.find({}, opts).to_a \
        .map!{|item| { :name => item['_id'], :score_sum => item['value'].to_i } }
  end
  
   def self.task_score_map(orgId)
     logger.debug "#{orgId}"
     @childChallenge = where(:challenge_id => orgId).and(:challenge_id.exists => true)
     logger.debug "#{@childChallenge}"
     logger.debug "Maisa"
     
    <<-MAP
      function() {
        var user_id = this.user_id;
        this.tasks.forEach(function(aTask) {
          emit(user_id, {score: aTask.score});
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
  
  def self.task_score_build(opts,orgId)
    self.collection.map_reduce(self.task_score_map(orgId), self.task_score_reduce, opts)
  end
  
  def self.task_score(orgId,opts={})
    logger.debug "#{orgId}"
    hash = opts.merge({ 
      :out    => {:inline => true},
      :limit => 15,
      :sort => [['_id', Mongo::ASCENDING]],
      :scope => 100002573213371,
      :raw    => true 
    }) 
    self.task_score_build(hash,orgId).find() 
  end
  
  
  
  def self.winner(orgId)
     @challenge = Challenge.where(:_id => orgId).first  
     aTotalScore = 0  
     @list=Hash.new()   
   
     if @challenge.instance_of?Challenge 
         @challenge.tasks.each_with_index do |orgTasks,index|
            if orgTasks.is_complete == 1
              aTotalScore += orgTasks.score.to_i
            end  
         end 
         @list[@challenge.user_id] = aTotalScore      
         
        
         aTotalScore = 0  
         @challenge.child_challenges.each do |aChildChallenge| 
             aChildChallenge.tasks.each_with_index do |eachTasks,index|             
                  if eachTasks.is_complete == 1
                    aTotalScore += eachTasks.score.to_i
                  end
             end   
        @list[aChildChallenge.user_id] = aTotalScore 
        aTotalScore = 0                 
        end  
        @winner = @list.sort {|a,b| -1*(a[1]<=>b[1]) }
        return @winner
     else 
       childchallenge
      end 
  end
  
  def self.winnerCompleteAllTask(orgId)
     @challenge = Challenge.where(:_id => orgId).first  
     aTotalScore = 0  
     @listCAT=Hash.new()   
     isCompletAll = 0
     if @challenge.instance_of?Challenge 
         @challenge.tasks.each_with_index do |orgTasks,index|
            if orgTasks.is_complete == 1
              isCompletAll = 1
              aTotalScore += orgTasks.score.to_i
            end  
         end 
         if isCompletAll == 1
          @listCAT[@challenge.user_id] = aTotalScore      
         end
        
         isCompletAll = 0
         aTotalScore = 0  
         @challenge.child_challenges.each do |aChildChallenge| 
             aChildChallenge.tasks.each_with_index do |eachTasks,index|             
                  if eachTasks.is_complete == 1
                    isCompletAll = 1
                    aTotalScore += eachTasks.score.to_i
                  end
             end   
            if isCompletAll == 1     
                @listCAT[aChildChallenge.user_id] = aTotalScore 
            end
            isCompletAll = 0
            aTotalScore = 0                 
        end  
        @winner = @listCAT.sort {|a,b| -1*(a[1]<=>b[1]) }
        return @winner
     else 
       childchallenge
      end 
  end

	def self.winnerFirstPersonReach(orgId)
     @challenge = Challenge.where(:_id => orgId).first  
     aTotalScore = 0  
     @listCAT=Hash.new()   
     isCompletAll = 0
     if @challenge.instance_of?Challenge 
         @challenge.tasks.each_with_index do |orgTasks,index|
            if orgTasks.is_complete == 1
              isCompletAll = 1
              aTotalScore += orgTasks.score.to_i
            end  
         end 
         if isCompletAll == 1
          @listCAT[@challenge.user_id] = aTotalScore      
         end
        
         isCompletAll = 0
         aTotalScore = 0  
         @challenge.child_challenges.each do |aChildChallenge| 
             aChildChallenge.tasks.each_with_index do |eachTasks,index|             
                  if eachTasks.is_complete == 1
                    isCompletAll = 1
                    aTotalScore += eachTasks.score.to_i
                  end
             end   
            if isCompletAll == 1     
                @listCAT[aChildChallenge.user_id] = aTotalScore 
            end
            isCompletAll = 0
            aTotalScore = 0                 
        end  
        @winner = @listCAT.sort {|a,b| -1*(a[1]<=>b[1]) }
        return @winner
     else 
       childchallenge
      end 
  end
  
  def self.scoreboard(challengeId)
     @challenge = Challenge.where(:_id => challengeId).first  
     aTotalScore = 0  
     @list=Hash.new()
    
     if @challenge.instance_of?Challenge 
         @challenge.tasks.each_with_index do |orgTasks,index|
            if orgTasks.is_complete == 1
              aTotalScore += orgTasks.score.to_i
            end  
         end 
         @list[@challenge.user_id] = aTotalScore      
         
        
         aTotalScore = 0  
         @challenge.child_challenges.each do |aChildChallenge| 
             aChildChallenge.tasks.each_with_index do |eachTasks,index|             
                  if eachTasks.is_complete == 1
                    aTotalScore += eachTasks.score.to_i
                  end
             end   
        @list[aChildChallenge.user_id] = aTotalScore 
        aTotalScore = 0                 
        end  
        @winner = @list.sort {|a,b| -1*(a[1]<=>b[1]) }
        return @winner
     else 
       @parentChallenge = Challenge.where(:_id => @challenge.challenge_id).first 
       @parentChallenge.tasks.each_with_index do |orgTasks,index|
            if orgTasks.is_complete == 1
              aTotalScore += orgTasks.score.to_i
            end  
         end 
         @list[@parentChallenge.user_id] = aTotalScore      
         
        
         aTotalScore = 0  
         @parentChallenge.child_challenges.each do |aChildChallenge| 
             aChildChallenge.tasks.each_with_index do |eachTasks,index|             
                  if eachTasks.is_complete == 1
                    aTotalScore += eachTasks.score.to_i
                  end
             end   
        @list[aChildChallenge.user_id] = aTotalScore 
        aTotalScore = 0                 
        end  
        @winner = @list.sort {|a,b| -1*(a[1]<=>b[1]) }
        return @winner
     end
  end
  
    
end                
