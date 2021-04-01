class EntriesController < ApplicationController
	
	def index
		@entries = Entry.order(date: :desc).entry_tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
	end
	def create
		entry_params = params["entry"].permit("title", "date","contents", "all_tags", "media")
		entry = Entry.create(entry_params)
		redirect_to(entry_path(entry))
	end
	def show
		@entry = Entry.find(params["id"])
		@tags = Entry.tags_on_entry(params["id"])
	end
	def edit 
		@entry = Entry.find(params["id"])
		@tags = Entry.tags_on_entry(params["id"])
	end
	def update
		entry_params = params["entry"].permit("title", "date", "contents", "all_tags", "media")
		entry = Entry.find(params["id"])
		entry.update(entry_params)
		redirect_to(entry_path(entry))
	end 
end