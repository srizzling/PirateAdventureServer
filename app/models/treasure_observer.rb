class TreasureObserver < ActiveRecord::Observer
	observe Treasure

	def before_create(treasure)
		length=5
		found=treasure.found

		



		random_string=rand(36**length).to_s(36)
	    treasure.keyword=random_string

	end

	def before_save(treasure)
		if found == true
			treasure.seeker=current_user.id
		end
	end

	def after_create(treasure)
		found=treasure.found
		username=treasure.seeker
		itemname=treasure.name
		

		#This should only be created when the found 
		#Create new HighScore Record
		if found==true
			item = HighScore.find_or_create_by_username(:username => username)
			if item.float == nil 
				item.float = 0
			else
				newFloat = item.float + 1
				item.float = newFloat
			end
			item.save
		end
	end
end