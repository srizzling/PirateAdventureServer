class TreasureObserver < ActiveRecord::Observer
	observe Treasure
def before_create(treasure)
    treasure.keyword="<3"
  end
end
