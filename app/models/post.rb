class Post < ActiveRecord::Base
  belongs_to  :user
  has_many  :comments
  validates :category, :inclusion => { :in => ["벤처","대경","창모","찬희"], :message => "벤처, 대경, 창모, 찬희 중 하나를 선택하셔야 합니다." }
  validates :title, :presence => { :message => "제목을 반드시 입력하셔야 합니다." }
end
