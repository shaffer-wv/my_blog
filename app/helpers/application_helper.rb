module ApplicationHelper

	def markdown(text)
	  	render_options = {
		    # will remove from the output HTML tags inputted by user 
		    filter_html:     true,
		    # will insert <br /> tags in paragraphs where are newlines 
		    # (ignored by default)
		    hard_wrap:       true, 
		    # hash for extra link options, for example 'nofollow'
		    link_attributes: { rel: 'nofollow' }
		    # more
		    # will remove <img> tags from output
		    # no_images: true
		    # will remove <a> tags from output
		    # no_links: true
		    # will remove <style> tags from output
		    # no_styles: true
		    # generate links for only safe protocols
		    # safe_links_only: true
		    # and more ... (prettify, with_toc_data, xhtml)
	  	}

	  	renderer = HTML.new(render_options)

	  	extensions = {
		    #will parse links without need of enclosing them
		    autolink:           true,
		    # blocks delimited with 3 ` or ~ will be considered as code block. 
		    # No need to indent.  You can provide language name too.
		    # ```ruby
		    # block of code
		    # ```
		    fenced_code_blocks: true,
		    # will ignore standard require for empty lines surrounding HTML blocks
		    lax_spacing:        true,
		    # will not generate emphasis inside of words, for example no_emphasis_no
		    no_intra_emphasis:  true,
		    # will parse strikethrough from ~~, for example: ~~bad~~
		    strikethrough:      true,
		    # will parse superscript after ^, you can wrap superscript in () 
		    superscript:        true
		    # will require a space after # in defining headers
		    # space_after_headers: true
	  	}
	  	Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
	end

	class HTML < Redcarpet::Render::HTML
		# to use Rouge with Redcarpet
		include Rouge::Plugins::Redcarpet
		# overriding Redcarpet method
		def block_code(code, language)
			# highlight some code with a given language lexer 
    		# and formatter: html or terminal256 
    		# and block if you want to stream chunks
    		Rouge.highlight(code, language || 'text', 'html')
    		# watch out you need to provide 'text' as a default, 
    		# because when you not provide language in Markdown 
    		# you will get error: <RuntimeError: unknown lexer >
		end
	end
	
end
