class TreasureObserver < ActiveRecord::Observer
	observe Treasure

	def before_create(treasure)
		length=5
		random_string=rand(36**length).to_s(36)
	    treasure.keyword=random_string
	end

	def after_save(treasure)
		found=treasure.found
		name=treasure.seeker
		

		#This should only be created when the found 
		#Create new HighScore Record
		if found==true
			item = HighScore.new
			item.username=name
			item.save
		end
	end
end