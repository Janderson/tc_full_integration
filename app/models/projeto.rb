class Projeto < ActiveRecord::Base
	attr_accessible :nome, :descricao
	belongs_to :usuario
	validates :usuario_id, :presence=>true
	validates :nome, :presence=>true
	validates :descricao, :presence=>true
	def to_s
		nome
	end
	
	def dono
		return self.usuario
	end
end
