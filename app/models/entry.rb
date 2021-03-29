class Entry < ApplicationRecord
	has_many :taggings
	has_many :tags, through: :taggings
	
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
end
