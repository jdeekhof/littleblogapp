module ApplicationHelper
	def markdown(text)
		options = [:highlight, :tables,:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_block, :underline]
		Markdown.new(text, *options).to_html.html_safe
	end
	
	def title(page_title)
 	 content_for(:title) { page_title }
	end
end
