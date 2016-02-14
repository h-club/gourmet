class EmailController < ApplicationController
	def email_form
	end

	def email_send
		email = "ncm4114@gmail.com"
    title = "글이 작성됨"
    content = "글 작성됨"
		require 'gmail'
    gmail = Gmail.connect("자신의_Gmail_계정_주소","자신의_Gmail_계정_비밀번호")
    gmail.deliver do
      to email
      subject title
      text_part do
        body content
      end
    end

    gmail.logout	

	end
end
