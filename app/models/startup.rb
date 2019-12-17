class Startup

    attr_reader :founder, :domain, :name
    @@all = []
    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain
        @@all << self 
    end 
    
    def pivot(domain, name) #private method
        @domain = domain 
        @name = name
    end 

    def self.find_by_founder(founder)
        @@all.first {|founder| @@all.founder == founder}
    end
    def self.all
        @@all
    end 
    def self.domains
        @@all.map {|startup| startup.domain} #go through each startup and collect domain
    end
    def sign_contract(venture_capitalist, investment,type)
        FundingRound.new(self, venture_capitalist, investment, type)
    end
    def num_funding_rounds ##Start1.num_funding_rounds
    FundingRound.all.count {|fundinground| fundinground.startup == self} #self because Start1 will have the same object ID
    end
    def total_funds
        total_sum = 0
        FundingRound.all.each do |fundinground|
            total_sum += fundinground.investment
        end
        total_sum
    end
    def investors_invested_in_a_specific_company
        FundingRound.all.select{|fundinground| fundinground.startup == self }
    end 
    def investors
        array = investors_invested_in_a_specific_company
            array.map {|fundinground| fundinground.venture_capitalist.name}.uniq #array1 = array 
    end 

    # def big_investors ##this is a method to acquire an array of strings
    #     array = investors_invested_in_a_specific_company
    #     array1 = array.select do |fundinground|
    #         fundinground.venture_capitalist.total_worth > 1000000000
    #     end #fundinground is the main object, venture_capitalist is another object within the main object
    #     array1.map {|fundinground| fundinground.venture_capitalist.name}.uniq
    # end #and total_worth is a part of venture_capitalist object
    
    ##this is a method to acquire an array of objects
    def big_investors
        array = investors_invested_in_a_specific_company
        array1 = array.map{|fundinground| fundinground.venture_capitalist}
        array1.select {|venture_capitalist|venture_capitalist.total_worth > 1000000000}.uniq
    end 
end
