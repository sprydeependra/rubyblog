class Article < ActiveRecord::Base

	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
    @total_user=10
     def total_user
     return 'hi to all'
     end               
end
