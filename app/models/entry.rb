class Entry < ApplicationRecord
	has_one_attached :media
	has_many :taggings
	has_many :tags, through: :taggings

	#media.attach(params[:media])
	
	def self.entry_tagged_with(tag)
		Tag.find_by(name: tag).entries
	end
	def self.tag_counts
		Tag.select('tags.*, count(taggings.tag_id) as
			count').joins(:taggings).group('taggings.tag_id')
	end
	def self.tags_on_entry(entry_id)
		Tag.where(id: Entry.find_by_id(entry_id).tag_ids)
	end
	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
	      Tag.where(name: name.strip).first_or_create!
    	end
    end
	def all_tags
	  self.tags.map(&:name).join(", ")
	end
end
