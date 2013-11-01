class Aluno < User
  has_and_belongs_to_many :diciplinas
  attr_accessible :matricula, :diciplina_ids
end
