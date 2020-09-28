class Article < ApplicationRecord
	has_one_attached :image

	has_many :comments , dependent: :destroy
	belongs_to :user
	validates :title , presence: true ,
	                   length: {minimum: 3}

	validates :body , presence: true,
	                  length: {minimum: 20}

def self.search(params)
		articles=Article.where("body LIKE ? or title LIKE ?","%#{params[:search]}%","%#{params[:search]}%")

        articles
	end
end
