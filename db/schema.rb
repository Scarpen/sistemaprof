# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131125121449) do

  create_table "arquivos", :force => true do |t|
    t.integer  "pasta_id"
    t.string   "arquivo"
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "atividades", :force => true do |t|
    t.string   "diciplina_id"
    t.float    "nota_maxima"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descricao"
    t.datetime "prazo"
  end

  create_table "controles", :force => true do |t|
    t.integer  "aluno_id"
    t.integer  "diciplina_id"
    t.integer  "situacao"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "diciplinas", :force => true do |t|
    t.string   "nome"
    t.string   "conteudo"
    t.integer  "professor_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "exercicios", :force => true do |t|
    t.integer  "aluno_id"
    t.integer  "atividade_id"
    t.float    "nota"
    t.string   "arquivo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pasta", :force => true do |t|
    t.string   "nome"
    t.integer  "diciplina_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "endereco"
    t.string   "telefone"
    t.string   "type"
    t.integer  "cpf"
    t.integer  "matricula"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
