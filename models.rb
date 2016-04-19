require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Course
  include DataMapper::Resource
  property :id, String, :key => true
  property :name, String
  
  has n, :recitations
  has n, :groups
end

class Group
  include DataMapper::Resource
  property :id, Serial
  property :letter, String
  
  belongs_to :course
  has n, :recitations
end

class Recitation
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :instruction, Text
  
  belongs_to :course
  belongs_to :taskset
  has n, :claims
end

class Taskset
  include DataMapper::Resource
  property :id, Serial
  
  has n, :recitations
  has n, :tasks
end

class Task
  include DataMapper::Resource
  property :id, Serial
  property :number, Integer
  property :instruction, Text
  
  belongs_to :taskset
  has n, :taskparts
end

class Taskpart
  include DataMapper::Resource
  property :id, Serial
  property :letter, String
  property :content, Text
  
  belongs_to :task
  has n, :claimparts
end

class Claim
  include DataMapper::Resource
  property :id, Serial
  property :student_id, String
  property :student_name, String
  property :grade, Integer
  property :demonstrated, Boolean, :default => false
  
  belongs_to :recitation
  has n, :claimparts
end

class Claimpart
  include DataMapper::Resource
  
  property :id, Serial
  
  belongs_to :taskpart
  belongs_to :claim
end

DataMapper.finalize